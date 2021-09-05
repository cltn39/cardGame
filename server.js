require('dotenv').config();
const express = require('express');
const apiRoutes = require('./routes/apiRoutes');
const htmlRoutes = require('./routes/htmlRoutes');
const mysql = require('mysql');

// User AUthentication(not set up yet!)
// const passport = require('passport')
// const jwtStrategy = require('passport-jwt').Strategy;
// const ExtractJwt = require('passport-jwt').ExtractJwt;

//Init Aapp/Port
const app = express();
const PORT = process.env.PORT;

// Route middleware
app.use(express.json());
app.use(express.urlencoded({extended: true}));
app.use(express.static('public'));
app.use('/api', apiRoutes);
app.use('/', htmlRoutes);

//mySQL connection 
const connection = mysql.createConnection({
  host: process.env.DB_HOST,
  port: process.env.DB_PORT,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_DB
});

// Initiate MySQL Connection
connection.connect((err) => {
  if (err) {
    console.error("error connection: " + err.stack);
    return;
  }
  console.log("connected as id " + connection.threadId);
});

if (process.env.NODE_ENV === "production") {
  app.use(express.static("client/build"));
}

// Passport middleware
// app.use(passport.initialize());
// require("./config/passport")(passport);
var opts = {}
opts.jwtFromRequest = ExtractJwt.fromAuthHeaderAsBearerToken();
opts.secretOrKey = 'secret';
opts.issuer = 'accounts.examplesoft.com';
opts.audience = 'yoursite.net';
passport.use(new JwtStrategy(opts, function(jwt_payload, done) {
    User.findOne({id: jwt_payload.sub}, function(err, user) {
        if (err) {
            return done(err, false);
        }
        if (user) {
            return done(null, user);
        } else {
            return done(null, false);
            // or you could create a new account
        }
    });
}));

// Routes goes here
////////-------/////////
app.get("/", function(req, res) {
  connection.query("", function(err, result) {
    if (err) {
      return res.status(500).end();
    }
    res.send("test test")
  })
})
// API routes definition goes here
/////////--------//////////

// Start our server so that it can begin listening to client requests.
app.listen(PORT, function() {
  // Log (server-side) when our server has started
  console.log("Server listening on: http://localhost:" + PORT);
});