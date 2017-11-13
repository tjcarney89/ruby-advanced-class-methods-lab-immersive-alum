class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = Song.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = Song.new
    new_song.name = name
    @@all << new_song
    new_song
  end

  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end
    end
    return nil
  end

  def self.find_or_create_by_name(name)
    potential_song = Song.find_by_name(name)
    if potential_song == nil
      new_song = Song.create_by_name(name)
    else
      return potential_song
    end
  end

  def self.alphabetical
    return @@all.sort { |a, b| a.name <=> b.name }
  end

  def self.new_from_filename(filename)
    components = filename.split(" - ")
    artist = components[0]
    title = components[1].chomp(".mp3")
    new_song = Song.new
    new_song.name = title
    new_song.artist_name = artist
    new_song
  end

  def self.create_from_filename(filename)
    components = filename.split(" - ")
    artist = components[0]
    title = components[1].chomp(".mp3")
    new_song = Song.new
    new_song.name = title
    new_song.artist_name = artist
    @@all << new_song
    new_song
  end

  def self.destroy_all
    @@all.clear
  end

end
