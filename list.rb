# frozen_string_literal: true

class List
  attr_accessor :list_title

  def initialize(list_title)
    @list_title = list_title
    @list_of_artists = []
  end

  def add_to_artists(artist)
    @list_of_artists << artist
  end

  def show_artists
    @list_of_artists.each do |artist|
      p artist.name.to_s
    end
  end

  def output_list(artist)
    p "#{artist.name} recorded following songs:"
    artist.songs_list.each do |song|
      p "#{song.title}, released: #{song.premiere}"
    end
  end

  def delete_artist(required_artist)
    @list_of_artists.delete_if { |artist| artist == required_artist }
  end
end
