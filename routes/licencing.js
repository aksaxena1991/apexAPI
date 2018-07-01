const encDec = require('../security-backups/enc-dec');
const consts = require('../constants/consts');
const codes = require('../message-types');
exports.generateLicence = function (req, res) {
    try {
        let keyString = '';
        var requestParams = {};
        req.body.hasOwnProperty('subscription') ?
        requestParams = req.body :
        req.params.hasOwnProperty('subscription') ?
        requestParams = req.params : 
        req.query.hasOwnProperty('subscription') ?
        requestParams = req.query : requestParams = {}
        var date = new Date();
        for (let key in consts.subscriptionTypes) {
            if (consts.subscriptionTypes[key].type === requestParams.subscription) {
                let next = new Date(date.getTime() + parseFloat(consts.subscriptionTypes[key].days) * 24 * 60 * 60 * 1000).toLocaleDateString();
                keyString = JSON.stringify(requestParams) + '/' + date.toLocaleDateString() + '/' + next;
            }
        }
        if (keyString.length > 0) {
            res.json({
                'serialKey': encDec.encryptor(keyString),
                'code': codes.messageCodes.Success,
                'message': 'Serial Key has been generated!'
            });
        } else {
            res.json({
                'code': codes.messageCodes.Error,
                'message': 'Unable to generate serial key!'
            });
        }
    }
    catch (ex) {
        console.log(ex);
    }

}
exports.getLicence = function (req, res) { }