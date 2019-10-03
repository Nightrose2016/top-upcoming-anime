require 'pry'
class CLI
    def run
        user_input = nil
        puts "Welcome to your seasonal anime database."
        puts "Would you like to see this season's most anticipated anime or all the upcoming seasonal anime?"
        puts 'Please input: "most anticipated" or "all seasonal".' 
        while user_input != 'exit'
            user_input = gets.chomp
        case user_input
        when "most anticipated"
            Scraper.top_upcoming_anime_scraper
            Anime.all.each.with_index(1) { |anime, index| puts "#{index} #{anime.title}" }
        when "all seasonal"
            Scraper.upcoming_anime_scraper
            Anime.all.each.with_index(1) { |anime, index| puts "#{index} #{anime.title}" }
        end
        menu
        end
    end

    def menu
        puts "Please select an anime to get it's details"
        input = gets.chomp
        anime = Anime.all[input.to_i-1]

        if !anime
            puts "Anime not found.  Please select a different movie!"
            menu
        else
            Scraper.scrape_anime_profile(anime)
            puts "Here are the details for #{anime.title}:"
            puts "Status: #{anime.status}"
            puts "Aired: #{anime.aired}"
            puts "Broadcast #{anime.broadcast}"
            puts "Studio(s) #{anime.studio}"
            puts "Genre #{anime.genre}"
            puts "Duration #{anime.duration}"
            puts "Rating #{anime.rating}"
        end
    end
end