require 'discordrb'
require 'cinch'

discord_bot = Discordrb::Commands::CommandBot.new token: '<insert token here>', client_id: <insert client id here>

irc_bot = Cinch::Bot.new do
  configure do |c|
    c.server = "<irc server>"
    c.channels = ["<channels>"]
    c.nick = "<bot name>"
  end

  @colours = [:red, :teal, :pink, :purple, :orange, :royal, :blue, :green, :brown]
  on :message, /(.+)/ do |m, text|
    discord_bot.send_message(<channel id>, "<#{m.user.nick}> #{text}", tts = false, embed = nil)
  end

  discord_bot.message(in: <channel id>) do |event, *args1|
    content = event.message.content
    event.message.mentions.each{|user| content = content.gsub("@" + user.id, "@" + user.username)}
    if event.message.attachments.empty?
      Channel("<channel>").send(Format(@colours.sample(random: Random.new(event.user.id.to_i)), "\<" + event.user.name + "\> ") + content)
    else
      Channel("<channel>").send(Format(@colours.sample(random: Random.new(event.user.id.to_i)), "\<" + event.user.name + "\> ") + event.message.attachments[0].url)
      if !content.empty?
        Channel("<channel>").send( Format(@colours.sample(random: Random.new(event.user.id.to_i)), "\<" +  event.user.name + "\> ") + content)
      end
    end
  end
end

irc = Thread.new {irc_bot.start}
discord = Thread.new {discord_bot.run}

irc.join
