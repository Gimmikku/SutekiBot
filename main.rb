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
    if event.message.attachments.empty?
      Channel("<channel>").send(Format(@colours.sample(random: Random.new(event.user.id.to_i)), "\<" + event.user.name + "\> ") + e$
    else
      Channel("<channel>").send(Format(@colours.sample(random: Random.new(event.user.id.to_i)), "\<" + event.user.name + "\> ") + e$
      if !event.message.content.empty?
        Channel("<channel>").send( Format(@colours.sample(random: Random.new(event.user.id.to_i)), "\<" +  event.user.name + "\> ")$
      end
    end
  end
end

irc = Thread.new {irc_bot.start}
discord = Thread.new {discord_bot.run}

irc.join
