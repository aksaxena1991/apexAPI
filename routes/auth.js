var jwt = require('jsonwebtoken');
var codes = require('../message-types');
exports.login = function (req, res) {
    try {
        var requestParams = {};
        req.body.hasOwnProperty('reg_username') ? requestParams = req.body : req.params.hasOwnProperty('reg_username') ? requestParams = req.params : req.query.hasOwnProperty('reg_username') ? requestParams = req.query : requestParams = {}

        var reg_username = requestParams.reg_username;
        var reg_password = requestParams.reg_password;

        req.getConnection(function (err, connection) {
            if (err) {
                console.log("SQL Connection: ", err);
            }
            else {
                connection.query("select * from registration where reg_username = ? and reg_password = ?", [reg_username, reg_password], function (error, result) {
                    if (error) {
                        console.log("Error wile executing query ", error);
                    }
                    else {
                        jwt.sign({'authenticatedUser': result}, 'secretkey', function (err, token) {
                            res.json({
                                token: token
                            });
                            req.session.data = {
                                token: token
                            };

                        });
                    }
                });
            }
        });
        // console.log(req.session.id, req.session);
    }
    catch (ex) {
        console.log("we caught an exception ", ex);
    }

}
exports.register = function (req, res) {
    try {
        var requestParams = {};
        req.body.hasOwnProperty('reg_username') ? requestParams = req.body : req.params.hasOwnProperty('reg_username') ? requestParams = req.params : req.query.hasOwnProperty('reg_username') ? requestParams = req.query : requestParams = {}

        var reg_username = requestParams.reg_username;
        var reg_password = requestParams.reg_password;
        var reg_email = requestParams.reg_email;

        req.getConnection(function (err, connection) {
            if (err) {
                console.log("SQL Connection: ", err);
            }
            else {
                connection.query('select * from registration where reg_email = ? or reg_username = ?', [reg_email, reg_username], function (error, result) {
                    if (result.length > 0) {
                        res.json({
                            "code": codes.messageCodes.AlreadyExist,
                            "message": "This user already exist"
                        });
                    } else {
                        var query = "INSERT INTO registration SET ?";
                        var values = {
                            'reg_username': reg_username, 'reg_password': reg_password, 'reg_email': reg_email
                        };
                        connection.query(query, values, function (error, result) {
                            if (error) {
                                res.json({
                                    "code": codes.messageCodes.Error,
                                    "message": error
                                });
                            }
                            else {
                                res.json({
                                    "code": codes.messageCodes.Success,
                                    "message": "Thank you for registering with us!"
                                });
                            }
                        });
                    }
                })

            }
        });
    }
    catch (ex) {
        console.log("we caught an exception ", ex);
    }
}
exports.forgotpassword = function (req, res) {
    try {
        var requestParams = {};
        req.body.hasOwnProperty('reg_email') ? requestParams = req.body : req.params.hasOwnProperty('reg_email') ? requestParams = req.params : req.query.hasOwnProperty('reg_email') ? requestParams = req.query : requestParams = {}
        var reg_email = requestParams.reg_email;
        req.getConnection(function (err, connection){
            if (err) {
                console.log("SQL Connection: ", err);
            } else {
                connection.query('select * from registration where reg_email = ?', [reg_email], function(err, result){
                    if(result.length == 0) {
                        res.json({
                            "code": codes.messageCodes.Error,
                            "message": "This user does not exist"
                        });
                    } else {

                    }
                });
            }
        });

    }
    catch (ex) {
        console.log("we caught an exception ", ex);
    }
}