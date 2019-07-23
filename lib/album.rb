class Album
  attr_reader :id
  attr_accessor :name
  @@albums = {}
  @@sold_albums = {}
  @@total_rows = 0

  def initialize(name, id)
    @name = name
    @id = id || @@total_rows += 1
  end

  def ==(album_to_compare)
    self.name() == album_to_compare.name()
  end

  def save
    @@albums[self.id] = Album.new(self.name, self.id)
  end

  def sell
    @@sold_albums[self.id] = Album.new(self.name, self.id)
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
    @@albums.sort_by { |key, value| value.name}
  end

  def update(name)
    self.name = name
    @@albums[self.id] = Album.new(self.name, self.id)
  end

  def delete
    @@albums.delete(self.id)
  end
end
