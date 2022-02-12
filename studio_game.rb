require_relative 'game'
require_relative 'clumsy_player'

clumsy = ClumsyPlayer.new("Clumclum", 100, 20)

xage = Game.new('XAge')
xage.load_players(ARGV.shift || "players.csv")
xage.add_players(clumsy)
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

xage.save_scores("new_rank.csv")