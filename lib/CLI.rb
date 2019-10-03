class CLI
    def run

        puts "Welcome to your seasonal anime database."
        puts "would you like to see this seasons most anticipated anime or all the upcoming seasonal anime?"
        puts '"Most anticipated" or "all seasonal".' 
        while user_input != 'exit'
            user_input = gets.chomp
        case user_input.downcase
        when "most anticipated"
            Scraper.top_upcoming_anime_scraper
            Anime.all.each.with_index { |anime, index| puts "#{index} #{anime.title}"
        when "all seasonal"
            Scraper.upcoming_anime_scraper
            Anime.all.each.with_index { |anime, index| puts "#{index} #{anime.title}"
        end
        menu
    end

    def menu
        puts "please select an anime to get it's details"
        input = gets.chomp
        Anime.all[input.to_i = 1]

        if !anime
         puts "Anime not found.  Please select a different movie!"
         menu
        else
            Scraper.scrape_anime_profile(anime)
            puts "Here are the details for #{anime.title}:"
            puts "Staus: #{status}"
            puts "Aired: #{aired}"
            puts ""
            
        else
            
        end
        end
    end
    
end