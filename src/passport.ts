import passport from "passport"
import { Strategy as JwtStrategy, ExtractJwt } from "passport-jwt"
import { Strategy as LocalStrategy } from "passport-local"
import bcrypt from "bcrypt"
// local imports
import prisma from "./prisma"
import { JWT_SECRET } from "./config"

// Login
passport.use(
  "login",
  new LocalStrategy(
    { usernameField: "username", passwordField: "password", session: false },
    async (username, password, done) => {
      try {
        let user = await prisma.user.findFirst({ where: { username } })
        if (!user) done(null, false, { message: "Bad username" })
        else {
          const isVerified = await bcrypt.compare(password, user.password)
          if (isVerified) {
            done(null, user)
          } else {
            done(null, false, { message: "Password do not match" })
          }
        }
      } catch (error) {
        done(error)
      }
    }
  )
)

// JWT for all authenticated route
passport.use(
  "jwt",
  new JwtStrategy(
    {
      jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
      secretOrKey: JWT_SECRET,
    },
    async (jwtPayload, done) => {
      const user = await prisma.user.findFirst({ where: { id: jwtPayload.id } })
      if (!user) done(null, false, { message: "Authorization failed" })
      done(null, user)
    }
  )
)
