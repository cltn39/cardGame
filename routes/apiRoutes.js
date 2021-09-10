const router = require("express").Router();
const mysql = require("mysql2");
// const store = require('../db/store');

//mySQL connection
const connection = mysql.createConnection({
  host: process.env.DB_HOST,
  port: process.env.DB_PORT,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_DB,
});

// GET "/api/gameDatas" -> responds with all the data from the database
router.get("/gameDatas", (req, res) => {
  //code goes here
  const query = `SELECT * FROM user`;

  connection.query(query, (err, data) => {
    if (err) {
      res.status(500).json({ error: err.message });
      return;
    }
    res.json({
      message: "success",
      data: data,
    });
  });
});

// POST "/api/gameDatas" -> Add data to the database
router.post("/gameDatas", (req, res) => {
  const { id, account, first, last } = req.body;
  db.query(
    `INSERT INTO user (UserID, AccountName, GivenName, FamilyName) VALUES ("${id}", "${account}", "${first}", "${last}")`,
    function (err, results) {
      if (err) {
        res.json(err);
      } else {
        console.info(
          `${req.method} request received to add data to the database`
        );
      }
      res.json(results);
    }
  );
});

// Delete "/api/gameDatas" -> deletes data from the database
router.delete("/gameDatas", (req, res) => {
  //code goes here
});

// UPDATE "/api/gameDatas" -> change data from the database
router.put("/gameDatas", (req, res) => {
  //code goes here
});

module.exports = router;
