require 'pry'
require 'colorize'
class CLI
    def run
        user_input = nil
        puts "Welcome to your seasonal anime database."
        puts "Would you like to see this season's most anticipated anime or all the upcoming seasonal anime?"
        puts 'Please input: "1" for most anticipated or "2" for all seasonal".'.colorize(:green) 
        puts ""
        while user_input != 'exit'
            user_input = gets.chomp
        case user_input
        when "1"
            Scraper.top_upcoming_anime_scraper
            Anime.all.each.with_index(1) { |anime, index| puts "#{index} #{anime.title}" }
        when "2"
            Scraper.upcoming_anime_scraper
            Anime.all.each.with_index(1) { |anime, index| puts "#{index} #{anime.title}" }
        end
        menu
        end
    end

    def menu
        puts ""
        puts "Please select an anime to get it's details".colorize(:green)
        input = gets.chomp
        anime = Anime.all[input.to_i-1]

        if !anime
            puts "Anime not found.  Please select a different movie!".colorize(:red)
            menu
        else
            Scraper.scrape_anime_profile(anime)
            puts "Here are the details for #{anime.title}:"
            puts "#{anime.aired}"
            puts "#{anime.broadcast}"
            puts "Studio(s) #{anime.studio}"
            puts "Genre #{anime.genre}"
            puts "#{anime.duration}"
            puts "Rating #{anime.rating}"
        end
    end
end