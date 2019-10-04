class Anime
  attr_accessor :title, :url, :aired, :broadcast, :studio, :genre, :duration, :rating, :status
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