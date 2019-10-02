require 'nokogiri'
require 'open-uri'
require 'pry'

def top_upcoming_anime_scraper

    html = open("https://myanimelist.net/")
    doc = Nokogiri::HTML(html)
    doc.css(".ranking-digest")[6].css(".ranking-unit").css(".data").each { |anime| 
        title = anime.css(".title")
        url =  anime.css(".title a").attr("href").value
        Anime.new(title, url)
    }
    #binding.pry

end

#top_upcoming_anime_scraper

def upcoming_anime_scraper
    html = open("https://myanimelist.net/anime/season")
    doc = Nokogiri::HTML(html)
    doc.css(".js-categories-seasonal").each { |anime|
        title = anime.css(".title-text")
        url = anime.css(".title-text a").attr("href").value
        Anime.new(title, url)
    }
    # binding.pry
end

# upcoming_anime_scraper

def scrape_anime_profile
    html = open("https://myanimelist.net/anime" + anime.url)
    doc = Nokogiri::HTML(html)
    binding.pry
end

scrape_anime_profile