require 'nokogiri'
require 'open-uri'
require 'pry'

def top_anime_scraper

    html = open("https://myanimelist.net/")
    doc = Nokogiri::HTML(html)
    binding.pry

end

top_anime_scraper