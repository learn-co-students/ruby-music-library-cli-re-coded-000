class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
    @files =[]
  end

  def files
    @files = Dir.glob("#{path}/*.mp3").collect{|f| f.gsub("#{path}/", "")} #glob returns an array of filenames matching the pattern
  end

  def import
    files.each{|f| Song.create_from_filename(f)}
  end
end
