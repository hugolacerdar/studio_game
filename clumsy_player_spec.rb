require_relative 'clumsy_player'
require_relative 'treasure_trove'

describe ClumsyPlayer do
  before do
    $stdout = StringIO.new
    @player = ClumsyPlayer.new("klutz")
  end

  it "only gets half the point value for each treasure" do
    expect(@player.total_gold).to eq(0)

    hammer = Treasure.new(:hammer, 50)
    @player.store_treasure(hammer)
    @player.store_treasure(hammer)
    @player.store_treasure(hammer)

    expect(@player.total_gold).to eq(75)

    crowbar = Treasure.new(:crowbar, 400)
    @player.store_treasure(crowbar)

    expect(@player.total_gold).to eq(275)

    yielded = []
    @player.each_treasure do |treasure|
      yielded << treasure
    end

    expect(yielded).to eq([Treasure.new(:"damaged hammer", 75), Treasure.new(:"damaged crowbar", 200)])
  end

  context "with a w00t booster" do
    before do
      @initial_health = 100
      @w00t_booster = 5
      @player = ClumsyPlayer.new("klutz", @initial_health, @w00t_booster)
    end
  
    it "has a w00t booster" do
      expect(@player.w00t_booster).to eq(5)
    end
  
    it "gets w00t_booster number of w00ts when w00ted" do
      @player.w00t
  
      expect(@player.health).to eq(@initial_health + (15 * @w00t_booster))
    end
  end  
end
