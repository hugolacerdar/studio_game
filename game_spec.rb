require_relative 'game'

describe Game do
    before do
        @game = Game.new('corn wars')
        $stdout = StringIO.new
    end

    context 'one player match' do
        before do
            @initial_health = 100
            @player = Player.new('kert', @initial_health)
            @game.add_players(@player)
        end

        it "w00ts the player if a high number is rolled" do 
            allow_any_instance_of(Die).to receive(:roll).and_return(5)
            @game.play(3)

            expect(@player.health).to eq(@initial_health + 15 * 3)
        end

        it "ignores the player if a medium number is rolled" do 
            allow_any_instance_of(Die).to receive(:roll).and_return(3)
            @game.play

            expect(@player.health).to eq(@initial_health)
        end

        it "blams the player if a low number is rolled" do 
            allow_any_instance_of(Die).to receive(:roll).and_return(2)
            @game.play(2)

            expect(@player.health).to eq(@initial_health - 10 * 2)
        end
    end

    context "in a collection of players" do
        before do
          @player1 = Player.new("moe", 100)
          @player2 = Player.new("larry", 200)
          @player3 = Player.new("curly", 300)
      
          @players = [@player1, @player2, @player3]
        end
      
        it "is sorted by decreasing score" do
          expect(@players.sort).to eq([@player3, @player2, @player1])
        end
      end

      it "assigns a treasure for total gold during a player's turn" do
        game = Game.new("Knuckleheads")
        player = Player.new("moe")
      
        game.add_players(player)
      
        game.play(1)
      
        expect(player.total_gold).not_to be_zero      
      end

      it "computes total gold collected as the sum of all player gold" do
        game = Game.new("Knuckleheads")
      
        player1 = Player.new("moe")
        player2 = Player.new("larry")
      
        game.add_players(player1)
        game.add_players(player2)
      
        player1.store_treasure(Treasure.new(:hammer, 50))
        player1.store_treasure(Treasure.new(:hammer, 50))
        player2.store_treasure(Treasure.new(:crowbar, 400))
      
        expect(game.total_gold_collected).to eq(500)
      end
end