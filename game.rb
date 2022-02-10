require_relative 'player'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game 

    attr_reader :title
    
    def initialize(title) 
        @title = title
        @players = []
    end

    def add_players(players)
        if(players.class == Array)
            players.each do |p|
                @players << p
            end
        elsif players.class == Player
            @players << players
        end
    end

    def play(rounds = 1)
        puts "\nThere are #{@players.size} players in #{@title}: "
        @players.each do |player|
          puts player
        end
        
        if @players.empty? 
            puts "Please add at least one player to be able to play."
            return
        end

        treasures = TreasureTrove::TREASURES
        puts "\nThere are a total of #{treasures.size} treasures on the game:"
        treasures.each {|t| puts "- #{t.item.to_s} is worth #{t.value} gold."}

        1.upto(rounds) do |round|
            if block_given?
                break if yield
            end
            
            puts "\nRound #{round}"

            @players.each do |player|
                GameTurn.take_turn(player)
            end
        end

        print_stats
    end

    def total_gold_collected
        @players.reduce(0) do |sum, player| 
            sum + player.total_gold
        end
    end

    def print_stats
        puts "\n#{@title} Statistics:"

        puts "\nA total of #{total_gold_collected} gold was collected:"
        @players.each do |player|
            puts "\n#{player.name} got a grand total of: #{player.total_gold} gold"
            player.each_treasure do |treasure| 
                puts "#{treasure.value} gold on #{treasure.item}"
            end
        end

        strong_players, wimpy_players = @players.partition {|player| player.strong?}
        
        puts "\n#{strong_players.size} strong players:"
        strong_players.each {|player| print_name_and_health(player)} 
        
        puts "\n#{wimpy_players.size} wimpy players:"
        wimpy_players.each {|player| print_name_and_health(player)} 

        puts "\n#{@title} High Scores:"
        @players.sort.each {|player| puts player.score_string}
    end

    def print_name_and_health(player) 
        puts "#{player.name} (#{player.health})"
    end
end

if __FILE__ == $0
    generic_game = Game.new('generic')
    generic_game.play
end