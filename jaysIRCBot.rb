require "socket"

server = "chat.freenode.net"
port = "6667"
nick = "ImmaHighBot"
channel = "#bitmaker"
greetingPrefix = "privmsg #{channel} :"
greetings = ["highbot wake up"]


ircSrvr = TCPSocket.open(server, port)

ircSrvr.puts "USER immahighbot 0 * ImmaHighBot"
ircSrvr.puts "NICK #{nick}"
ircSrvr.puts "JOIN #{channel}"
ircSrvr.puts "PRIVMSG #{channel} :Hello I'm HighBot!"

until ircSrvr.eof? do
	msg = ircSrvr.gets.downcase
	puts msg

	wasGreeted = false
	greetings.each do |a|
		wasGreeted = true if msg.include?(a)
	end

	if msg.include?(greetingPrefix) && wasGreeted
		response = "is waking up.."
		ircSrvr.puts "PRIVMSG #{channel} :#{response}"
	elsif msg.include? "pinging high bot"
		response = "yeah yeah i got your ping.. maybe you can make me a smarter bot?"
		ircSrvr.puts "PRIVMSG #{channel} :#{response}"
	elsif msg.include? "whats pi to the 50?"
		response = "3.14159265358979323846264338327950288419716939937510"
		ircSrvr.puts "PRIVMSG #{channel} :#{response}"		
	elsif msg.include? "are you sure highbot?"
		response = "yes."
		ircSrvr.puts "PRIVMSG #{channel} :#{response}"		
	 
	end
end