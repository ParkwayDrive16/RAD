def myMethod (arr)
	yield arr
end
array = [1, 2, 3, 4, 5, 6, 7, 8]

myMethod(array){|i| i.each {|var|  puts(var *= 2)}}
myMethod(array){|i| sum = 0; i.each {|var| sum += var}; puts sum}
myMethod(array){|i| i.each {|var| var > 3 ? puts(var) : ""}}