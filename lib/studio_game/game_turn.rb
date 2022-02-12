require_relative 'die'

module StudioGame
    module GameTurn
        def self.take_turn(player)
            die = Die.new
            case die.roll
            when 1..2
                player.blam
            when 3..4
                puts "#{player.name} was ignored."
            else
                player.w00t
            end

            treasure = TreasureTrove.random
            player.store_treasure(treasure)
        end
    end
end