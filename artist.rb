# frozen_string_literal: true

class Artist
  attr_accessor :name, :birthdate, :origin
  attr_reader :songs_list

  def initialize(name:, birthdate:, origin:)
    @name = name
    @birthdate = birthdate
    @origin = origin
    @songs_list = []
  end

  def update(name:, birthdate:, origin:)
    @name = name
    @birthdate = birthdate
    @origin = origin
  end

  def find_song(song_to_display)
    @songs_list.find do |song|
      song.title == song_to_display
      song.title.casecmp(song_to_display)
    end
  end

  def add_to_artists_song_list(song)
    @songs_list << song
  end

  def delete_song(required_song)
    @songs_list.delete_if { |song| song == required_song }
  end
end
