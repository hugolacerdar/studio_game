require_relative 'game'

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)
player4 = Player.new("dorly", 200)

battledroids = Game.new("Battledroids of Ooo")

battledroids.play
battledroids.add_players(player1)
battledroids.add_players([player3, player2])
# battledroids.play(5)

doom = Game.new("Doom of Ooo")
doom.add_players([player1, player2, player3, player4])
#doom.play(10) do
#   doom.total_gold_collected >= 20000
#end

xage = Game.new('XAge')
xage.load(ARGV.shift || "players.csv")
loop do
    puts "\nHow many rounds? ('quit' to exit)"
    answer = gets.chomp.downcase
    case answer
    when /^\d+$/
        puts "About to play #{answer} rounds..."
        xage.play(answer.to_i)
    when 'quit', 'exit'
        xage.print_stats
        break
    else 
        puts "Please enter a number or 'quit'"
    end
end