module Top100RockBands
    class Band 
        attr_accessor :biography
        attr_reader :rank, :name, :soundtrack, :link

        @@all = []
        
        def initialize(rank, name, soundtrack, link) 
            @rank = rank 
            @name = name 
            @soundtrack = soundtrack
            @link = link
            @biography = "Sorry no bio available for this band"
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