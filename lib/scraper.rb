require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './band.rb'

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
    end
end
