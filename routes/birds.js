import express from "express"
import pool from "../db.js"

const router = express.Router()

router.get("/", async (req, res) => {
  // const [birds] = await pool.promise().query('SELECT * FROM birds')
  const [birds] = await pool.promise().query(
    `SELECT birds.*, species.name AS species 
      FROM birds 
      JOIN species ON birds.species_id = species.id;`,
  )
  // res.json(birds)
  res.render("birds.njk", { title: "Alla fågglar", message: "Fixa sidan", birds }) // ditt jobb är att skapa en res.render med nunjucks här
})

router.get("/:id", async (req, res) => {
  const [bird] = await pool.promise().query(
    `SELECT birds.*, species.name AS species 
      FROM birds 
      JOIN species ON birds.species_id = species.id WHERE birds.id = ?;`,
    [req.params.id],
  )
  res.render("bird.njk", { title: "En fåggel", message: "Fixa sidan", bird: bird[0] }) // ditt jobb är att skapa en res.render med nunjucks här
})

export default router