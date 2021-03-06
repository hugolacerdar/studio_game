require_relative "auditable"

module StudioGame
    class Die 
        include Auditable

        attr_reader :number

        def initialize
            @number = rand(1..6)
        end
        
        def roll
            @number = rand(1..6)
            audit
            @number
        end
    end
end