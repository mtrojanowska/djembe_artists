class Artist
  attr_accessor :name, :list

  def initialize(name)
    @name = name
  end

  def create(artist)
    @artist = artist
    @artist
    p @artist.name
  end

  def update(name)
    @name = name
  end
end

class List < Artist
  attr_accessor :list
  def initialize(list)
    @list = list
  end

  def save(*artists)
    @list = []
    artists.each do |artist|
    @list << artist
    end
    p @list
  end

  def destroy(artist)
    @list.delete(@artist)
    @list
  end
end


artist = Artist.new("Archi")
artist1 = Artist.new("Momoto")
artist2 = Artist.new("Zulugula")

artist.update("Santa Klaus")

list = List.new("Artists")


list.save(Artist.new("Obi").name, Artist.new("Kenobi").name, Artist.new("Leah").name, Artist.new("Chewbacca").name)

list.save(artist.name, artist1.name, artist2.name)
