module Top100RockBands
    class Scraper
        
        def self.get_bands
            doc = Nokogiri::HTML(open('https://www.imdb.com/list/ls027913678/'))
            doc.css('.lister-item').each.with_index(1) do |row, index|
                name = row.css('.lister-item-header a').text.strip
                link = row.css('.lister-item-header a').attribute('href').value
                soundtrack = row.css('.text-small a').text.strip
                Top100RockBands::Band.new(index, name, soundtrack, link)
            end
        end

        def self.get_band_bio(band) 
            doc = Nokogiri::HTML(open("https://www.imdb.com/#{band.link}/bio"))
            if doc.css('.soda p:first-of-type').text.strip != ""
                band.biography = doc.css('.soda p:first-of-type').text.strip
            end
        end
    end
end
