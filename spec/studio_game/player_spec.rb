require 'studio_game/player'
require 'studio_game/treasure_trove'

module StudioGame
    describe Player do
        before do
            $stdout = StringIO.new
            @initial_hp = 199
            @player = Player.new('hugo', @initial_hp)
        end

        it "has a capitalized name" do
            expect(@player.name).to eq('Hugo')
        end

        it "has a string representation" do
            @player.store_treasure(Treasure.new(:skull, 100))

            expect(@player.to_s).to eq("I'm Hugo with health = 199HP, total gold = 100 and a score = 299GP.")
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

        context "with health greater than 100" do
            before do
                @player = Player.new('hugo', 120)
            end

            it "is strong" do
                expect(@player).to be_strong
            end
        end

        context "with health of 100 or less" do
            before do
                @player = Player.new('hugo', 100)
            end

            it "is strong" do
                expect(@player).not_to be_strong
            end
        end

        it "computes total gold as the sum of all treasure value" do
            expect(@player.total_gold).to eq(0)
        
            @player.store_treasure(Treasure.new(:hammer, 50))
        
            expect(@player.total_gold).to eq(50)
        
            @player.store_treasure(Treasure.new(:crowbar, 400))
        
            expect(@player.total_gold).to eq(450)
        
            @player.store_treasure(Treasure.new(:hammer, 50))
        
            expect(@player.total_gold).to eq(500)
        end

        it "computes a score as the sum of its health and total gold" do
            @player.store_treasure(Treasure.new(:hammer, 50))
            @player.store_treasure(Treasure.new(:hammer, 50))
            
            expect(@player.score).to eq(299)
        end

        it "yields each found treasure and its total points" do
            @player.store_treasure(Treasure.new(:skillet, 100))
            @player.store_treasure(Treasure.new(:skillet, 100))
            @player.store_treasure(Treasure.new(:hammer, 50))
            @player.store_treasure(Treasure.new(:bottle, 5))
            @player.store_treasure(Treasure.new(:bottle, 5))
            @player.store_treasure(Treasure.new(:bottle, 5))
            @player.store_treasure(Treasure.new(:bottle, 5))
            @player.store_treasure(Treasure.new(:bottle, 5))
        
            yielded = []
            @player.each_treasure do |treasure|
            yielded << treasure
            end
        
            expect(yielded).to eq([
            Treasure.new(:skillet, 200),
            Treasure.new(:hammer, 50),
            Treasure.new(:bottle, 25)
        ])
        end
        
        it "can be created from a CSV string" do
            player = Player.from_csv("larry,150")
        
            expect(player.name).to eq("Larry")
            expect(player.health).to eq(150)
        end
    end
end