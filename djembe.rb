require './artist'
require './song'

class List
  attr_accessor :list_of_artists, :songs_list

  def initialize(list, songs_list)
    @list_of_artists = []
    @songs_list = Hash.new {|h, k| h[k] = [] }
  end

  def add_to_songs_list(artist,song)
     @songs_list[artist]<<song
     @songs_list
  end

  def complete_list
      @songs_list.each do |artist, songs|
        p "#{artist.name} recorded:"
        songs.each do |song|
        p "#{song.title}"
      end
    end
  end

  def output_artists_song_list(required_artist)
     @songs_list.each do |artist, songs|
        if required_artist == artist
          p "#{artist.name} recorded following songs:"
          songs.each do |song|
          p "#{song.title}"
        end
      end
    end
  end

  def delete_artist(artist)
    @songs_list.delete(artist)
  end

  def delete_song(required_artist, required_song)
      @songs_list.each do |artist, songs|
        songs.each do |song|
          if required_artist == artist && required_song == song
            @songs_list[artist].delete(song)
        end
      end
    end
  end

end
