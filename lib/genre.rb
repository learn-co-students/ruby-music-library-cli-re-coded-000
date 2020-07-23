class Genre
  extend  Concerns::Findable

@@all=[]
attr_accessor :name , :songs
def initialize(name)
  @name=name
  @songs=[]
end
def self.create(name)
  genre=Genre.new(name)
  genre.save
  genre
end
def artists()
  self.songs.collect {|e| e.artist}.uniq
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
def  add_song(song)
  if self.songs.detect { |e| e==song }
  else
   self.songs.push(song)
  if song.genre !=self
    song.genre=self
   end
   end
 end

end
