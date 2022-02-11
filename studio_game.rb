require_relative 'game'

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

xage.save("new_rank.csv")