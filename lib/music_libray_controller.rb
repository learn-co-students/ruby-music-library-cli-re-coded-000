class MusicLibraryController
  attr_accessor :path
  def initialize(path = './db/mp3s')
   @path=path
   MusicImporter.new(path).import
  end
  def call
    puts "please enter command"
    input=""

   while input!="exit"
     input=gets.strip

     if input=="list songs"
       counter=1
       MusicImporter.new(path).files.each do |file|
           puts "#{counter}. #{file.sub(".mp3","")}"
           counter+=1
        end
      elsif input=="list artists"
        counter=1
        MusicImporter.new(path).files.each do |file|
            puts "#{counter}. #{file.sub(".mp3","").split(" - ")[0]}"
            counter+=1
         end

       elsif input=="list genres"
         counter=1
         MusicImporter.new(path).files.each do |file|
             puts "#{counter}. #{file.sub(".mp3","").split(" - ")[2]}"
             counter+=1
          end
        elsif input=="play song"
          puts "enter song index "
          index=gets.strip
          file_name=MusicImporter.new(path).files[index.to_i-1]
          puts "Playing #{file_name.sub(".mp3","")}"
        elsif input=="list artist"
          puts "enter artist's name"
          artist_name=gets.strip
          counter=1
          Artist.find_by_name(artist_name).songs.uniq.each do |song|
             puts "#{counter}. #{artist_name} - #{song.name} - #{song.genre.name}"
             counter+=1
             end
        elsif input=="list genre"
          puts "enter genre's name"
          genre_name=gets.strip
          counter=1
          Genre.find_by_name(genre_name).songs.uniq.each do |song|
          puts "#{counter}. #{song.artist.name} - #{song.name} - #{genre_name}"
          counter+=1
          end
       end
   end
  return input
  end
end
