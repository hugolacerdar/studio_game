name1 = "larry"
health1 = 60

name2 = "curly"
health2 = 125

name3 = "moe"
health3 = 100

name4 = "shemp"
health4 = 90


puts "#{name1.capitalize} has a health of #{health1}."
puts "#{name2.upcase} has a health of #{health2}."

health2 = health1
health1 = 30
puts "#{name1.capitalize} has a health of #{health1}."
puts "#{name2.upcase} has a health of #{health2}."

puts "#{name3.capitalize} has a health of #{health3}.".center(50, "*")

puts "#{name4.capitalize.ljust(30, '.')} #{health3} health"

# puts "Players: \n\t#{name1}\n\t#{name2}\n\t#{name3}"