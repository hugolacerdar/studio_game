require_relative 'treasure_trove'

describe Treasure do

  before do
    @treasure = Treasure.new(:hammer, 15)
  end

  it "has a item attribute" do
    @treasure.item.should == :hammer
  end

  it "has a value attribute" do
    @treasure.value.should == 15
  end

end

describe TreasureTrove do

  it "has 5 treasures" do
    TreasureTrove::TREASURES.size.should == 5
  end

  it "has a ruby worth 200 gold" do
    TreasureTrove::TREASURES[0].should == Treasure.new(:ruby, 200)
  end

  it "has a diamond worth 400 gold" do
    TreasureTrove::TREASURES[1].should == Treasure.new(:diamond, 400)
  end

  it "has a saphire worth 150 gold" do
    TreasureTrove::TREASURES[2].should == Treasure.new(:saphire, 150)
  end

  it "has a ancient gold sword worth 300 gold" do
    TreasureTrove::TREASURES[3].should == Treasure.new(:"ancient gold sword", 300)
  end

  it "has a wooden leg worth 100 gold" do
    TreasureTrove::TREASURES[4].should == Treasure.new(:"wooden leg", 100)
  end

  it "returns a random treasure" do
    treasure = TreasureTrove.random
  
    TreasureTrove::TREASURES.should include(treasure)
  
    # or use alternate expectation syntax:
    # expect(TreasureTrove::TREASURES).to include(treasure)
  end
end
