module.exports = (robot) ->
  robot.respond /realm status/i, (msg) ->
    robot.http("https://us.battle.net/api/wow/realm/status?realms=senjin")
      .header('Accept', 'application/json')
      .get() (err, res, body) ->
        if err
          msg.send "Battle.net API is not responding"
          return

        try
          data = JSON.parse(body)
        catch error
          msg.send "Ran into an error parsing JSON :("
          return

        status = if data.realms[0].status then "up" else "down"

        msg.send "Sen'jin is " + status
