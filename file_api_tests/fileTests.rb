file = File.open("short.txt", "w+")

while !file.eof
	puts file.gets
end

file.close