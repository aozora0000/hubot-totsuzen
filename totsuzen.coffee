# Description:
#   突然の死ジェネレーター Hubot版
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot totsuzen - Receive 突然の死！
#   hubot totsuzen [query] - Receive [query]！
#
String::lengthByte = ->
  str = this
  r = 0
  for i in [0..str.length - 1]
    c = str.charCodeAt(i)
    if (c >= 0x0 && c < 0x81) || (c == 0xf8f0) || (c >= 0xff61 && c < 0xffa0) || (c >= 0xf8f1 && c < 0xf8f4)
      r += 1
    else
      r += 2
  return r

String::repeat = (n) ->
  return new Array(n + 1).join(this)

module.exports = (robot) ->

  robot.respond /tots?uzen\s*(.*)?/i, (msg) ->
    str = if msg.match[1] then msg.match[1].trim()+"！" else "突然の死！"
    msg.send str.length
    msg.send str.lengthByte()
    len = Math.floor(str.lengthByte() / 2)

    msg.send "＿" + ("人".repeat(len + 2)) + "＿"
    msg.send "＞　" + str + "　＜"
    msg.send "￣" + ("Ｙ".repeat(len + 2)) + "￣"
