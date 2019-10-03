require 'nokogiri'
require 'open-uri'
require 'pry'
class Scraper
    
    def self.top_upcoming_anime_scraper

        html = open("https://myanimelist.net/")
        doc = Nokogiri::HTML(html)
        doc.css(".ranking-digest")[6].css(".ranking-unit").css(".data").each { |anime| 
            title = anime.css(".title").text.strip
            url =  anime.css(".title").attr("href").value
            Anime.new(title, url)}
        #binding.pry

    end

    #top_upcoming_anime_scraper

    def self.upcoming_anime_scraper
        html = open("https://myanimelist.net/anime/season")
        doc = Nokogiri::HTML(html)
        doc.css(".js-categories-seasonal").each { |anime|
            title = doc.css(".js-categories-seasonal").css(".title-text").text.strip
            url = anime.css(".title-text a").attr("href").value 
            Anime.new(title, url)}
        # binding.pry
    end

    # upcoming_anime_scraper

    def self.scrape_anime_profile(anime)
        html = open(Anime.url)
        doc = Nokogiri::HTML(html)
        # Anime.status =  
        # Anime.aired = 
        # Anime.broadcast =
        # Anime.studio =
        # Anime.genre =
        # Anime.duration =
        # Anime.rating =
        binding.pry
    end
end

# scrape_anime_profile