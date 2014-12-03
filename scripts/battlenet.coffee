module.exports = (robot) ->
  robot.respond /realm status/i (msg) ->
    robot.http("https://us.battle.net/api/wow/realm/status?realms=senjin")
      .header('Accept', 'application/json')
      .get() (err, res, body) ->
        if err
          msg.send "Battle.net API is not responding"
          return

        if response.getHeader('Content-Type') isnt 'application/json'
          msg.send "Didn't get back JSON :("
          return

        data = null
        try
          data = JSON.parse(body)
        catch error
          msg.send "Ran into an error parsing JSON :("
         return

       status = data.realms[0].status ? "up" : "down"

       msg.send "Sen'jin is " + status
