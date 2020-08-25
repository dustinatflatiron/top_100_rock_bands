require_relative './scraper.rb'
require_relative './band.rb'

module Top100RockBands
    class UserInterface

        def start
            Top100RockBands::Scraper.get_bands
            Top100RockBands::Band.all.each do |band|
                puts "#{band.rank}: #{band.name} featured in #{band.soundtrack}"
            end
        end
    end
end

Top100RockBands::UserInterface.new.start