import { Router, Request, Response, NextFunction } from "express"
import passport from "passport"
import jwt from "jsonwebtoken"
// local imports
import { httpStatus } from "../helper"
import { JWT_SECRET } from "../config"

const AuthRouter = Router()

AuthRouter.post("/login", (req: Request, res: Response, next: NextFunction) => {
  passport.authenticate("login", { session: false }, (err, user, info) => {
    if (err) {
      res.status(400).send({ message: info.message })
    }
    if (!user) {
      res.status(400).send({ message: info.message })
    }
    if (!!user) {
      req.login(user.id, (err) => {
        const token = jwt.sign({ id: user.id }, JWT_SECRET, {
          expiresIn: "12h",
        })
        res.status(httpStatus.OK).send({
          auth: true,
          token,
          message: "User logged in successfully",
        })
      })
    }
  })(req, res, next)
})

export default AuthRouter
export { AuthRouter }
