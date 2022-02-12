require 'studio_game/treasure_trove'

module StudioGame
  describe Treasure do

    before do
      @treasure = Treasure.new(:hammer, 15)
    end

    it "has a item attribute" do
      expect(@treasure.item).to eq(:hammer)
    end

    it "has a value attribute" do
      expect(@treasure.value).to eq(15)
    end

  end

  describe TreasureTrove do

    it "has 5 treasures" do
      expect(TreasureTrove::TREASURES.size).to eq(5)
    end

    it "has a ruby worth 200 gold" do
      expect(TreasureTrove::TREASURES[0]).to eq(Treasure.new(:ruby, 200))
    end

    it "has a diamond worth 400 gold" do
      expect(TreasureTrove::TREASURES[1]).to eq(Treasure.new(:diamond, 400))
    end

    it "has a saphire worth 150 gold" do
      expect(TreasureTrove::TREASURES[2]).to eq(Treasure.new(:saphire, 150))
    end

    it "has a ancient gold sword worth 300 gold" do
      expect(TreasureTrove::TREASURES[3]).to eq(Treasure.new(:"ancient gold sword", 300))
    end

    it "has a wooden leg worth 100 gold" do
      expect(TreasureTrove::TREASURES[4]).to eq(Treasure.new(:"wooden leg", 100))
    end

    it "returns a random treasure" do
      treasure = TreasureTrove.random
    
      expect(TreasureTrove::TREASURES).to include(treasure)
      end
  end
end