require 'nokogiri'
require 'open-uri'
require 'pry'

def top_upcoming_anime_scraper

    html = open("https://myanimelist.net/")
    doc = Nokogiri::HTML(html)
    doc.css(".ranking-digest")[6].css(".ranking-unit").css(".data").each { |anime| 
        title = anime.css(".title")
        url =  anime.css(".title a"). attr("href").value
        Movie.new(title, url)
    }
    #binding.pry

end

#top_upcoming_anime_scraper

def upcoming_anime_scraper
    html = open("https://myanimelist.net/anime/season")
    doc = Nokogiri::HTML(html)
    binding.pry
end

upcoming_anime_scraper