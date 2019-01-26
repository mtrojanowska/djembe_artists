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

  def add_to_list(song)
    @songs_list << song
  end

  def delete_song(required_song)
    @songs_list.delete_if { |song| song == required_song }
  end
end
