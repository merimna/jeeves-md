module.exports = (robot) ->
  robot.catchAll (msg) ->
    if msg.message.match /// ^#{robot.name}\s ///i
      user_name = msg.message.user.name
      responses = [
        "No, you!",
        "I'm sorry, #{user_name}. I'm afraid I can't do that",
        "Time out for a second. That wasn't supposed to happen.",
        "Let's be honest: Neither one of us knows what that thing does. Just put it in the corner, and I'll deal with it later.",
        "Nice job breaking it, hero.",
        "I sincerely hope you weren't expecting a response. Because I'm not talking to you.",
        "I'd just like to point out that you were given every opportunity to succeed.",
        "Look, you're wasting your time. And, believe me, you don't have a whole lot left to waste.",
        "You've been wrong about every single thing you've ever done, including this thing.",
        "Oh... It's you.",
        "You broke it, didn't you."
      ]

      randomInt = (low, high) ->
        Math.floor(Math.random() * (high - low) + low);

      msg.send responses[randomInt(0, responses.length)]
