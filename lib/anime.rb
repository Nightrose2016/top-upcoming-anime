class Anime
  attr_accessor :title, :url, :status, :aired, :broadcast, :studio, :genre, :duration, :rating
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