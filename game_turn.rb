require_relative 'die'

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
        puts "#{player.name} found the item #{treasure.item} (+#{treasure.value})"
    end
end