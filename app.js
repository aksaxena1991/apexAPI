const express = require('express');
const connection = require('express-myconnection');
const bodyParser = require('body-parser');
const cookieParser = require('cookie-parser');
const expressSession = require('express-session');
const mysql = require('mysql');
const path = require('path');
const port = process.env.PORT || 3000;
const app = express();
app.use(cookieParser());
app.use(expressSession({
    secret: 'apex_billing_application',
    resave: true,
    saveUninitialized: false,
    cookie: {
        secure: true,
        expires: 600000
    }
}));
app.use(function (req, res, next) {
    if (req.cookies.session_id) {
        console.log(req.cookies.session_id);
        res.clearCookie('session_id');
    }
    next();
});
app.use(function (req, res, next) {

    // Website you wish to allow to connect
    res.setHeader('Access-Control-Allow-Origin', '*');

    // Request methods you wish to allow
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');

    // Request headers you wish to allow
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');

    // Set to true if you need the website to include cookies in the requests sent
    // to the API (e.g. in case you use sessions)
    res.setHeader('Access-Control-Allow-Credentials', true);

    // Pass to next layer of middleware
    next();
});
app.use(express.json());
app.use(
    connection(mysql, {
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'apex-billing',
        port: 3306
    }, 'pool') //or single
);
app.use(bodyParser.urlencoded({
    extended: true
}));
app.use(express.static(path.join(__dirname, 'public/dist')));
const auth = require('./routes/auth');
const coupons = require('./routes/coupons');
app.get('/', function (req, res) {
    res.render('index');
});
//  auth starts from here
app.get('/api/auth/login', auth.login);
app.post('/api/auth/register', auth.register);
app.get('/api/auth/verify', auth.verify);
//  coupons starts from here
app.get('/api/coupons/allCoupons', coupons.allCoupons);
app.listen(port, function () {
    console.log('This billing application has been running on ' + port);
});