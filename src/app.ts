import express, { Express, Request, Response } from "express"
import cors from "cors"
import helmet from "helmet"
// local imports
import { httpStatus } from "./helper"
import { rootRouter } from "./router"

const app: Express = express()
app.use(cors())
app.use(express.json())
app.use(express.urlencoded({ extended: false }))
app.use(helmet())

app.use("/api/v1", rootRouter)

app.get("/", (req: Request, res: Response) => {
  res.status(httpStatus.OK).send("API Working Successfully")
})

export default app
