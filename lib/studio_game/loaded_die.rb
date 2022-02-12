require_relative "auditable"

module StudioGame
    class LoadedDie 
        include Auditable

        attr_reader :number

        def roll
            sides = [1, 1, 2, 5, 6, 6]
            @number = sides.sample
            audit
            @number
        end
    end
end
