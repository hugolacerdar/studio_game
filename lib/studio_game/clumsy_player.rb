require_relative "player"

module StudioGame
    class ClumsyPlayer < Player
        attr_reader :w00t_booster

        def initialize(name, health = 100, w00t_booster = 2)
            super(name, health)
            @w00t_booster = w00t_booster
        end

        def w00t
            @w00t_booster.times { super }
        end

        def store_treasure(treasure)
            super(damage_treasure(treasure))
        end

        def damage_treasure(treasure)
            damaged_item = ("damaged " + treasure.item.to_s).to_sym
            Treasure.new(damaged_item, treasure.value/2)
        end
    end
end