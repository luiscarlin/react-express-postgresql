import express from 'express'
import cors from 'cors'

const app = express()
const port = 5000

var allowedOrigins = ['http://localhost:3000']

app.use(
  cors({
    origin: allowedOrigins,
  })
)

app.get('/', (req, res) => {
  res.send({ key: 'luis' })
})

app.listen(port, () => console.log(`listening on port ${port}`))
