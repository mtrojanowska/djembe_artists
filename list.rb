

class List

attr_accessor :list_title

  def initialize(list_title)
    @list_title = list_title
  end

  def output_list(artist)
      p "#{artist.name} recorded following songs:"
      artist.artists_list.each do |song|
      p "#{song}"
    end
  end

  def delete_artist(artist)
    artist.artists_list.delete(artist)
  end

end
