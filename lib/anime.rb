class Anime
  @@all = []

    def initialize(title, url)
      @title = title
      @url = url
      @@all << self
    end

    def self.all
        @@all
    end
end