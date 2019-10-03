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
        
    end
    
end