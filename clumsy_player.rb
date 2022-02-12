require_relative "player"

class ClumsyPlayer < Player
    def store_treasure(treasure)
        super(damage_treasure(treasure))
    end

    def damage_treasure(treasure)
        damaged_item = ("damaged " + treasure.item.to_s).to_sym
        Treasure.new(damaged_item, treasure.value/2)
    end
end

