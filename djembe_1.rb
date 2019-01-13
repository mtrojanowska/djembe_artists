class Artist
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def create(artist)
    @artist = artist
    @artist.name
  end

  def update(name)
    @name = name
  end
end

class List
  attr_accessor :list

  def initialize(list)
    @list = []
  end

  def add_to_list(artist)
    @list.push(artist)
  end

  def print_list
    print @list
  end

  # def save(*artists)
  #   @list = []
  #   artists.each do |artist|
  #   @list << artist
  #   end
  #   @list
  # end

  def destroy(artist)
    @list.delete(artist)
    @list
  end
end


artist = Artist.new("Archi")
artist1 = Artist.new("Momoto")
artist2 = Artist.new("Zulugula")

artist.update("Santa Klaus")

artists = List.new("Artists")


artists.destroy("Obi")

artist3=artist.create(Artist.new("One"))

artists.add_to_list(artist3)


artist4=artist.create(Artist.new("Two"))
artists.add_to_list(artist4)


artist5=artist.create(Artist.new("Three"))
artists.add_to_list(artist5)

artists.print_list


#artists.save(Artist.new("Obi").name, Artist.new("Kenobi").name, Artist.new("Leah").name, Artist.new("Chewbacca").name)
# artists.save(artist.name, artist1.name, artist2.name)
