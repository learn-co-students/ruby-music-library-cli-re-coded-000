class Artist
  extend  Concerns::Findable

@@all=[]
attr_accessor :name,:songs,:genre
def initialize(name)
  @name=name
  @songs=[]
end
def self.create(name)
  artist=Artist.new(name)
  artist.save
  artist
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

def genres
return self.songs.collect {|e| e.genre}.uniq
end

def  add_song(song)
  if self.songs.detect { |e| e==song }
  else
   self.songs.push(song)
  if song.artist !=self
    song.artist=self
   end
   end
 end
 end
