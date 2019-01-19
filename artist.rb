class Artist
  attr_accessor :name, :birthdate, :origin

  def initialize(name, birthdate, origin)
    @name = name
    @birthdate = birthdate
    @origin = origin
  end

  def create(artist)
    @artist = artist
  end

  def update(name)
    @name = name
  end
end
