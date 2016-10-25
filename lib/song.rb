class Song
extend  Concerns::Findable
@@all=[]
attr_accessor :name
def initialize(name,artist=nil,genre=nil)
  @name=name
  @artist=artist
  @genre=genre
  if artist !=nil
    artist.add_song(self)
  end
  if genre !=nil
    genre.add_song(self)
  end
end
def artist=(artist)
   @artist=artist
   artist.add_song(self)
end
def artist
  @artist
end

def genre=(genre)
   @genre=genre
   genre.add_song(self)
end
def genre
  @genre
end

def self.create(name,artist=nil,genre=nil)
  song=Song.new(name,artist,genre)
  song.save
  song
end
def self.all
  return @@all
end
def save
  @@all.push(self)
end
def self.destroy_all
  self.all.clear
end
def self.new_from_filename(name)
  name=name.sub(".mp3","")
  arr=name.split(" - ")
  artist=Artist.find_or_create_by_name(arr[0])
  genre=Genre.find_or_create_by_name(arr[2])
  return self.new(arr[1],artist,genre)
end
def self.create_from_filename(name)
  name=name.sub(".mp3","")
  arr=name.split(" - ")
  artist=Artist.find_or_create_by_name(arr[0])
  genre=Genre.find_or_create_by_name(arr[2])
  song=self.create(arr[1],artist,genre)

end
end
