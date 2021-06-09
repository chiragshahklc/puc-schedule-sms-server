# puc-schedule-sms-server

```
dotenv -e .env.development -- npx prisma migrate dev --name init
```

To generate random jwt token

```js
require('crypto').randomBytes(48, function(err, buffer) {
    var token = buffer.toString('hex');
    console.log(token) // this will be random token that can be use for jwt token
});
```
