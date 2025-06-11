number_s = 0
remainderMod_3 = 0
multiple_5 = 0

20.times do
  number_s += 1
  remainderMod_3 = number_s % 3
  multiple_5 = number_s % 5
  if remainderMod_3 == 0 && multiple_5 == 0
  	puts "FizzBuzz"
  elsif remainderMod_3 == 0
  	puts "Fizz"
  elsif  multiple_5 == 0
  	puts "Buzz" 
  else
  	puts number_s
  end
end
