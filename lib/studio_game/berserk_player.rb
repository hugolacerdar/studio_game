require_relative "player"

module StudioGame
    class BerserkPlayer < Player 
        def initialize(name, health = 100)
            super(name, health)
            @times_w00ted = 0
        end

        def berserker?
            @times_w00ted > 5
        end

        def w00t 
            @times_w00ted += 1
            super
        end

        def blam 
            case berserker?
            when true
                w00t
            when false
                super
            end
        end
    end
end