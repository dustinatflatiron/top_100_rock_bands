module Top100RockBands
    class UserInterface

        def start
            Top100RockBands::Scraper.get_bands
            list_bands
            input = ''
            while input != 'exit'
                puts "Please type the rank of the band you would like to see more information about, 'list' to see the list again or 'exit' to quit the program"
                input = gets.strip
                if input.to_i > 0 && input.to_i <= Top100RockBands::Band.all.length
                    band = Top100RockBands::Band.all[input.to_i - 1]
                    Top100RockBands::Scraper.get_band_bio(band)
                    puts band.biography
                elsif input == 'list'
                    list_bands
                elsif input == 'exit'
                    break
                else 
                    puts 'Invalid input'
                end
            end
        end

        def list_bands
            Top100RockBands::Band.all.each do |band|
                puts "#{band.rank}: #{band.name} featured in #{band.soundtrack}"
            end
        end
    end
end

