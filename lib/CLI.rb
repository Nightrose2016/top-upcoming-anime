class CLI
    def run

        puts "Welcome to your seasonal anime database."
        puts "Would you like to see this season's most anticipated anime or all the upcoming seasonal anime?"
        puts '"Please input: most anticipated" or "all seasonal".' 
        while user_input != 'exit'
            user_input = gets.chomp
        case user_input
        when "most anticipated"
            Scraper.top_upcoming_anime_scraper
            Anime.all.each.with_index { |anime, index| puts "#{index} #{anime.title}" }
        when "all seasonal"
                Scraper.upcoming_anime_scraper
                Anime.all.each.with_index { |anime, index| puts "#{index} #{anime.title}" }
        end
        end
        menu
    end

    def menu
        puts "Please select an anime to get it's details"
        input = gets.chomp
        Anime.all[input.to_i = 1]

        if !anime
            puts "Anime not found.  Please select a different movie!"
            menu
        else
            Scraper.scrape_anime_profile(anime)
            puts "Here are the details for #{anime.title}:"
            puts "Status: #{Anime.status}"
            puts "Aired: #{Anime.aired}"
            puts "Broadcast #{Anime.broadcast}"
            puts "Studio(s) #{Anime.studio}"
            puts "Genre #{Anime.genre}"
            puts "Duration #{Anime.duration}"
            puts "Rating #{Anime.rating}"
        end
    end
end