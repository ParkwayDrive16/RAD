def myFilter (hash)
	hash.select{|key,value| yield(value)}
end

hash = {Alex:90, Bill:70, Casey:80, Kyryl:109}
puts myFilter(hash){|value| value > 75}

puts myFilter(hash){|value| value < 90}
puts myFilter(hash){|value| value.to_s[-1] == "9"}