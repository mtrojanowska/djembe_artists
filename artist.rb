class Artist
  attr_accessor :name, :birthdate, :origin, :artists_list

  def initialize(name:, birthdate:, origin:)
    @name, @birthdate, @origin = name, birthdate, origin
    @artists_list = []
  end

  def update(name:, birthdate:, origin:)
    @name = name
    @birthdate = birthdate
    @origin = origin
  end

  def add_to_lists(song)
     @artists_list<<song
  end

  def delete_song(required_song)
    @artists_list.each do |song|
     if required_song == song
       @artists_list.delete(song)
  end
  end
end

end
