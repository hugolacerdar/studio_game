Treasure = Struct.new(:item, :value)

module TreasureTrove
    TREASURES = [
        Treasure.new(:ruby, 200),
        Treasure.new(:diamond, 400),
        Treasure.new(:saphire, 150),
        Treasure.new(:"ancient gold sword", 300),
        Treasure.new(:"wooden leg", 100),
    ]

    def self.random
        TREASURES.sample
    end
end

if __FILE__ == $0 
    puts TreasureTrove::TREASURES
    puts TreasureTrove.random.item
end