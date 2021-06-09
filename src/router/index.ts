import { Router } from "express"
import passport from "passport"
// local imports
import "../passport"
import AuthRouter from "./auth"
import MessageRouter from "./messages"

const router = Router()
router.use(AuthRouter)
router.use(passport.authenticate("jwt", { session: false }))
router.use(MessageRouter)

export default router
export { router as rootRouter }
