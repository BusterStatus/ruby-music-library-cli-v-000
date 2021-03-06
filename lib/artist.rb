class Artist
  
  attr_accessor :name, :songs, :artist
  
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end
  
  def add_song(song)
    if song.artist === nil
      song.artist = self
    end
    if @songs.include?(song) === false
      @songs << song
    end
  end
  
  def genres
    genres_array = @songs.collect {|song| song.genre}
    genres_array.uniq
  end
  
end