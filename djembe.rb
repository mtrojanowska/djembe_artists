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

  def save(*artists)
    @list = []
    artists.each do |artist|
    @list << artist
    end
    p @list
  end


  def update(name)
    @name = name
  end

  def destroy(artist)
    @list.delete(artist)
    p @list
  end

end

artist = Artist.new("Archi")
artist1 = Artist.new("Momoto")

artist.update("Santa Klaus")

artist.create(Artist.new("Aragorn"))
artist.save(Artist.new("Obi").name, Artist.new("Kenobi").name, Artist.new("Leah").name, Artist.new("Chewbacca").name)

artist1.save(artist.name, artist1.name)
artist.destroy("Kenobi")
