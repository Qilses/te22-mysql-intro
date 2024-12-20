import "dotenv/config"
import express from "express"
import nunjucks from "nunjucks"
import morgan from "morgan"
import bodyParser from "body-parser"
import pool from "./db.js"
import birdsRouter from "./routes/birds.js"


const app = express()
const port = 3000

nunjucks.configure('views', { //Detta ska bara vara   
  autoescape: true,
  express: app,
})

app.use(morgan("dev"))
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.use(express.static("public"))

app.get("/", async (req, res) => {
  res.render("index.njk", {
    title: "Hello World",
    message: "Hello World",
  })
})

app.post('/species', async (req, res) => {
  const { name, latin, wingspan_min, wingspan_max } = req.body

  const [result] = await pool.promise().query('INSERT INTO species (name, latin, wingspan_min, wingspan_max) VALUES (?, ?, ?, ?)', [name, latin, wingspan_min, wingspan_max])
  res.redirect('/species')
  res.json(result)
})


//app.use("/birds", birdsRouter)
app.get("/birds", async (req, res) => {
  // const [birds] = await pool.promise().query('SELECT * FROM birds')
 
  const [birds] = await pool
    .promise()
    .query(
      `SELECT birds.*,
      spieces.name AS spieces FROM birds 
      JOIN spieces ON birds.species_id = spieces.id;`

    )
  res.json(birds)
}) 

app.get('/birds/new', async (req, res) => {
  const [species] = await pool.promise().query('SELECT * FROM species')

  res.render('birds_form.njk', { species })
})

app.post('/birds', async (req, res) => {
  const { name, latin, wingspan_min, wingspan_max } = req.body

  const [result] = await pool.promise().query('INSERT INTO species (id, namn, species_id, wingspan, species_name) VALUES (?, ?, ?, ?, ?)', [id, namn, species_id, wingspan, species_name])
  res.redirect('/birds')
  res.json(result)
})



app.get("/birds/:id", async (req, res) => {
  const [bird] = await pool
    .promise()
    .query(
      `SELECT birds.*,
       spieces.name AS spieces FROM birds JOIN spieces ON birds.species_id = spieces.id WHERE birds.id = ?;`,
      [req.params.id],
    )
    res.render("birds.njk", {
      title: 'bird',
      bird: bird[0],
      
    }) 
  res.json(bird[0])
 
})

app.use((req, res) => {
  res.status(404).render('404.njk', {
    title: '404  not found',
  })
})

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})