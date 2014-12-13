module.exports = (robot) ->
  robot.catchAll (msg) ->
    msg.send "No, you!"
