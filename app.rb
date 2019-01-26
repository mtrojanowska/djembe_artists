# frozen_string_literal: true

require_relative 'artist'
require_relative 'song'
require_relative 'list'

list = List.new("First_list")

p "Add to artists:"
p "Name:"
name_input = gets.chomp
p "Date of birth:"
birthdate_input = gets.chomp
p "Country of origin:"
origin_input = gets.chomp

artist = Artist.new(name: name_input, birthdate: birthdate_input, origin: origin_input)
list.add_to_artists(artist)

p "Add a song:"
p "Song title:"
song_title = gets.chomp
p "Song release:"
song_premiere = gets.chomp
song = Song.new(title: song_title, premiere: song_premiere)
artist.add_to_list(song)
artist.songs_list

list.show_artists

p "Show artist"
artist = gets.chomp
list.output_list(artist)
