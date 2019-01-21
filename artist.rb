class Artist
  attr_accessor :name, :birthdate, :origin, :songs_list

  def initialize(name:, birthdate:, origin:, songs_list:)
    @name = name
    @birthdate = birthdate
    @origin = origin
    @songs_list = Hash.new {|h, k| h[k] = [] }
  end

  def update_name(name)
    @name = name
  end

  def update_birthdate(birthdate)
    @birthdate = birthdate
  end

  def update_origin(origin)
    @origin = origin
  end

  def add_to_lists(artist,song)
     @songs_list[artist.name]<<song
  end

  def output_artist_list(required_artist)
     @songs_list.each do |artist, songs|
         if required_artist == artist
           p "#{artist} recorded following songs:"
           songs.each do |song|
           p song
        end
      end
    end
  end


end
