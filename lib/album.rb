class Album
  attr_reader :id
  attr_accessor :name, :artist, :year, :genre
  @@albums = {}
  @@sold_albums = {}
  @@total_rows = 0

  def initialize(name, id, artist, year, genre)
    @name = name
    @artist = artist
    @year = year
    @genre = genre
    @id = id || @@total_rows += 1
  end

  def ==(album_to_compare)
    self.name() == album_to_compare.name()
  end

  def save
    @@albums[self.id] = Album.new(self.name, self.id, self.artist, self.year, self.genre)
    Album.sort()
  end

  def sell
    @@sold_albums[self.id] = Album.new(self.name, self.id, self.artist, self.year, self.genre)
    @@albums.delete(self.id)
  end

  def self.all()
    @@albums.values()
  end

  def self.sold()
    @@sold_albums.values()
  end

  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@albums[id]
  end

  def self.search(album_name)
    @@albums.each_value do |value|
      if value.name == album_name
          return value
      end
    end
  end

  def self.sort()
  sorted_array = @@albums.sort_by { |key, value| value.name}
  @@albums = Hash[sorted_array.map {|key, value| [key, value]}]
  end

  def update(name)
    self.name = name
    @@albums[self.id] = Album.new(self.name, self.id, self.artist, self.year, self.genre)
  end

  def delete
    @@albums.delete(self.id)
  end
end
