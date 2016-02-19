Botkit = require('botkit')

controller = Botkit.slackbot(
  debug: false
)

defaultBot = controller.spawn({
  token: process.env.SLACK_API_KEY,
}).startRTM()

controller.on "direct_message", (bot, message) ->

  if message.text[0] == "1"
    # RTM
    console.log "Received message"
    console.log message
    reply = {"text":"[1] echo #{message.text}","parse":"none"}
    console.log "Replying with"
    console.log reply
    bot.reply(message, reply, (err, res) ->
      console.log(err, res)
    )
  else if message.text[0] == "2"
    console.log "Received message"
    console.log message
    reply = {"text":"[2] echo #{message.text}","parse":"none", "attachments":[{text: message.text}]}
    console.log "Replying with"
    console.log reply
    bot.reply(message, reply, (err, res) ->
      console.log(err, res)
    )
