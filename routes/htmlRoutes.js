const path = require('path');
const router = require('express').Router();

// "/map" goes to map.html file (map.html not created)
router.get('/map', (req, res) => {
    res.sendFile(path.join(__dirname, "../client/public/map.html"))
})

module.exports = router;