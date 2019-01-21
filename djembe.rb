

class List

attr_accessor :list_title, :songs_list

 def initialize(list_title)
   @list_title = list_title
 end

 def output_complete_list(artist)
      artist.songs_list.each do |artist, songs|
        p "#{artist} recorded following songs:"
        songs.each do |song|
        p "#{song}"
      end
    end
  end

  def delete(artist, required_artist)
    artist.songs_list.delete(required_artist)
  end

  def delete_song(artist,required_song)
    artist.songs_list.each do |artist, songs|
      songs.each do |song|
        if required_song == song
          songs.delete(song)
        end
      end
    end
  end


end
