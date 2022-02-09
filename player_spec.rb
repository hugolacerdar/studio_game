require_relative 'player'

describe Player do
    before do
        @initial_hp = 199
        @player = Player.new('hugo', @initial_hp)
    end

    it "has a capitalized name" do
        expect(@player.name).to eq('Hugo')
    end



    it "has a string representation" do
        expect(@player.to_s).to eq("I'm Hugo with 199HP and a score of 203GP.")
    end

    it "increases hp by 15 when w00ted" do
        @player.w00t 
        expect(@player.health).to eq(@initial_hp + 15)
    end

    it "decreases hp by 10 when blammed" do
        @player.blam 
        expect(@player.health).to eq(@initial_hp - 10)
    end

    context "created with a default health" do
        before do
            @player = Player.new('hugo')
        end

        it "has a health of 100" do
            expect(@player.health).to eq(100)
        end
    end
end