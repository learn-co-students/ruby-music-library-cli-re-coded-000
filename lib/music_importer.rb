class MusicImporter
  attr_accessor :path
def initialize(path)
  @path=path
  @files=[]
end
def files
  Dir.glob("#{path}/*.mp3") do |file|
   @files.push(file.sub(/^.*\//,""))
end
return @files
end
def import
  files.each do |file|
    Song.create_from_filename(file)
  end
end
end
