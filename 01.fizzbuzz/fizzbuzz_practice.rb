remainder_mod_3 = 0
remainder_mod_5 = 0

20.times{|n|
  n += 1
  remainder_mod_3 = n % 3
  remainder_mod_5 = n % 5
  if remainder_mod_3 == 0 && remainder_mod_5 == 0
    puts "FizzBuzz"
  elsif remainder_mod_3 == 0
    puts "Fizz"
  elsif  remainder_mod_5 == 0
    puts "Buzz" 
  else
    puts n
end
}
