module Top100RockBands
    class Band 
        attr_reader :rank, :name, :soundtrack, :link

        @@all = []
        
        def initialize(rank, name, soundtrack, link) 
            @rank = rank 
            @name = name 
            @soundtrack = soundtrack
            @link = link
            self.save
        end

        def save 
            @@all << self 
        end

        def self.all 
            @@all 
        end
    end
end