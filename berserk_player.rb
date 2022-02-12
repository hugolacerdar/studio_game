require_relative "player"

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

if __FILE__ == $0
    berserkito = BerserkPlayer.new('Ror', 100)
    puts berserkito.berserker
    berserkito.w00t
    berserkito.w00t
    berserkito.w00t
    berserkito.w00t
    berserkito.w00t
    berserkito.blam
    puts berserkito.berserker
    berserkito.w00t
    puts berserkito.berserker
    berserkito.blam
end