class MusicLibraryController
  attr_reader :music_importer
def initialize(path="./db/mp3s")
  music_importer=MusicImporter.new(path)
  music_importer.import
end
def call
input=""
while input !="exit"
 puts "Welcome to Your Music Library!"
 puts "What would you like to do?"
  input=gets.strip
  case input
  when "list songs"
  songs
  when "list artists"
  artists
  when "list genres"
    genres
  when "play song"
    play_song
  when "list artist"
    list_artist_songs
  when "list genre"
    list_genre_songs
  end

end
end
def songs
  Song.all.each.with_index(1) do |s, i|
    puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
  end
end
def artists
  Artist.all.each.with_index(1) do |a, i|
    puts "#{i}. #{a.name}"
  end
end
def genres
  Genre.all.each.with_index(1) do |g, i|
    puts "#{i}. #{g.name}"
  end
end
def play_song
  puts "What song number would you like to play?"
    song_input = gets.strip
    puts "Playing #{Song.all[song_input.to_i-1].artist.name} - #{Song.all[song_input.to_i-1].name} - #{Song.all[song_input.to_i-1].genre.name}"
end
def list_artist_songs
  puts "What artist by name you like to list songs for?"
    artist_input = gets.strip
    if artist = Artist.find_by_name(artist_input)
      artist.songs.each do |s,i|
        puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
      end
    end
end
def list_genre_songs
  puts "What genre by name you like to list songs for?"
    genre_input = gets.strip
    if genre = Genre.find_by_name(genre_input)
      genre.songs.each do |s,i|
        puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
      end
    end
end
end
