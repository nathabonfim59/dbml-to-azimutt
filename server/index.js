const env = require('dotenv')
const express = require('express')
const cors = require('cors')
const app = express()
const root_dir = process.env.SERVER_ROOT
const port = process.env.SERVER_PORT


app.use(cors)
app.use('/', express.static(root_dir))

app.listen(port, () => {
  console.log('\n\n\n')
  console.log('===========================================================')
  console.log(` 📣 Dbml2Azimutt server started on port ${port}`)
  console.log('')
  console.log(` 📁 Container folder: ${root_dir}/`)
  console.log(` 🌐 Location: http://localhost:${port}/`)
  console.log('-----------------------------------------------------------')
  console.log(' ⭐ us on Github: github.com/nathabonfim59/dbml-to-azimutt')
})
