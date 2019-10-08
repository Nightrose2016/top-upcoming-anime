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

    def self.upcoming_anime_movies
        html = open("https://myanimelist.net/anime/season")
        doc = Nokogiri::HTML(html)
        doc.css(".js-seasonal-anime-list-key-3").css(".title-text").css(".link-title").each { |anime| 
            title = anime.text
            url = doc.css(".js-seasonal-anime-list-key-3").css(".title-text").css(".link-title").attr("href").value
            Anime.new(title, url)
        }
    #     #binding.pry
    end

    # upcoming_anime_movies

    def self.scrape_anime_profile(anime)
        html = open(anime.url)
        doc = Nokogiri::HTML(html)
        anime.aired =  doc.css(".borderClass").css(".spaceit")[7].text.split("Aired:")[1].strip
        anime.duration = doc.css(".borderClass").css(".spaceit")[11].text.split("Duration:")[1].strip
        if doc.css(".borderClass").css("div")[9].css("a").text == "Movie"
            # anime.studio = doc.css(".borderClass").css("div")[15].css("a").text
            anime.broadcast = "this is a movie with no schedualed broadcast"
            # anime.genre =  doc.css(".borderClass").css("div")[17].text.split("\n")[2]
            # anime.rating = doc.css(".borderClass").css("div")[19].text.gsub("\n", "").strip
            binding.pry
        # elsif doc.css(".borderClass").css("div")[9].text.split("Type:")[1].strip == "TV"
        #     anime.aired =  doc.css(".borderClass").css(".spaceit")[7].text.split("Aired:")[1].strip
        #     anime.broadcast = doc.css(".borderClass").css(".spaceit")[8].text.split("Broadcast:")[1].strip
        #     anime.duration = doc.css(".borderClass").css(".spaceit")[11].text.split("Duration:")[1].strip

        else    
            anime.broadcast = doc.css(".borderClass").css(".spaceit")[8].text.split("Broadcast:")[1].strip
            # anime.studio = doc.css(".borderClass").css("div")[18].text.gsub("\n", "").strip
            anime.genre = doc.css(".borderClass").css("div")[20].text.gsub("\n", "").strip
            anime.rating = doc.css(".borderClass").css("div")[22].text.gsub("\n", "").strip
            binding.pry
        end
    end
end

# scrape_anime_profile