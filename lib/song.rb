class Song
attr_accessor :name, :artist,:genre
@@all=[]
def initialize(name,artist=Artist.new(""),genre=Genre.new(""))
  @name=name
  self.artist=artist
  self.genre=genre
end
def self.all
  @@all
end
def self.destroy_all
  @@all=[]
end
def save
  @@all << self
end
def self.create(name,artist=Artist.new(""),genre=Genre.new(""))
  new(name,artist,genre).tap{|s| s.save}
end
def artist=(artist)
  @artist = artist
  artist.add_song(self)
end
def genre=(genre)
  @genre= genre
  genre.add_song(self)
end
def self.find_by_name(name)
  self.all.detect{|s| s.name==name}
end
def self.find_or_create_by_name(name)
  self.find_by_name(name)||self.create(name)
end
def self.new_from_filename(filename)
  str=filename.split(" - ")
  artist=Artist.find_or_create_by_name(str[0])
  genre=Genre.find_or_create_by_name(str[2].gsub(".mp3",""))
  self.new(str[1],artist,genre)
end
def self.create_from_filename(filename)
  str=filename.split(" - ")
  artist=Artist.find_or_create_by_name(str[0])
  genre=Genre.find_or_create_by_name(str[2].gsub(".mp3",""))
  self.create(str[1],artist,genre)
end
end
