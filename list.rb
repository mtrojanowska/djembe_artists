# frozen_string_literal: true

class List
  attr_accessor :list_title
  attr_reader :list_of_artists

  def initialize(list_title)
    @list_title = list_title
    @list_of_artists = []
  end

  def add_to_artists(artist)
    @list_of_artists << artist
  end

  def show_artists
    @list_of_artists.each_with_index do |artist, i|
      p "#{i + 1}. #{artist.name}"
    end
  end

  def find_artist(artist_to_display)
    @list_of_artists.find do |artist|
      artist.name == artist_to_display
      artist.name.casecmp(artist_to_display)
    end
  end

  def show_artist(artist)
    p "#{artist.name}, born #{artist.birthdate} in #{artist.origin} recorded following songs:"
    artist.songs_list.each do |song|
      p "#{song.title}, released: #{song.premiere}"
    end
  end

  def delete_artist(required_artist)
    @list_of_artists.delete_if { |artist| artist == required_artist }
  end
end
