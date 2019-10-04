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
            Anime.new(title, url)
        }
        #binding.pry

    end

    #top_upcoming_anime_scraper

    def self.upcoming_anime_scraper
        html = open("https://myanimelist.net/anime/season")
        doc = Nokogiri::HTML(html)
        doc.css(".js-categories-seasonal").css(".title").each { |anime|
            title = anime.css(".title-text").text.strip
            url = anime.css(".title-text a").attr("href").value 
            Anime.new(title, url)
        }

        # binding.pry
    end

    # upcoming_anime_scraper

    def self.scrape_anime_profile(anime)
        html = open(anime.url)
        doc = Nokogiri::HTML(html)
        if doc.css(".borderClass").css("div")[9].css("a").text == "Movie"
            anime.aired = doc.css(".borderClass").css("div")[12].text
            anime.studio = doc.css(".borderClass").css("div")[15].css("a").text
            anime.genre = doc.css(".borderClass").css("div")[17].css("a").attr("title").value
            anime.rating = doc.css(".borderClass").css("div")[19].text
            anime.duration = doc.css(".borderClass").css("div")[18].text
            binding.pry
        else    
            # anime.status =  
            anime.aired = doc.css(".borderClass").css(".spaceit")[7].text
            anime.broadcast = doc.css(".borderClass").css(".spaceit")[8].text
            # anime.studio =
            # anime.genre =
            anime.duration = doc.css(".borderClass").css(".spaceit")[11].text
            # anime.rating =
            binding.pry
        end
    end
end

# scrape_anime_profile