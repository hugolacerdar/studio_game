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
            @game.play

            expect(@player.health).to eq(@initial_health + 15)
        end

        it "ignores the player if a medium number is rolled" do 
            allow_any_instance_of(Die).to receive(:roll).and_return(3)
            @game.play

            expect(@player.health).to eq(@initial_health)
        end

        it "blams the player if a low number is rolled" do 
            allow_any_instance_of(Die).to receive(:roll).and_return(2)
            @game.play

            expect(@player.health).to eq(@initial_health - 10)
        end
    end

end