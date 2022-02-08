name1 = "larry"
health1 = 60
name2 = "curly"
health2 = 125
name3 = "moe"
health3 = 100
name4 = "shemp"
health4 = 90

def time 
    current_time = Time.new
    current_time.strftime("%I:%M:%S")
end

def player_presentation(player_name, player_health = 100)
    "#{player_name.capitalize.ljust(30, ".")}#{player_health.to_s.ljust(3, ' ')} health (#{time})"
end

puts player_presentation(name1, health1)
puts player_presentation(name2, health2)
puts player_presentation(name3)
puts player_presentation(name4, health4)