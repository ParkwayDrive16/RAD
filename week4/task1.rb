array = [1, 2, 3, 4, 5, 6, 7, 8]
array.each { |x| x.odd? ? puts(x) : ""}

array.each do |i|
  if i.odd?
  	puts i
  end
end
