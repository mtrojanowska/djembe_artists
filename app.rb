# frozen_string_literal: true

require_relative 'artist'
require_relative 'song'
require_relative 'list'

song = Song.new(title: 'First song', premiere: '1998.11.04')
song1 = Song.new(title: 'Second song', premiere: '1996.10.01')
song2 = Song.new(title: 'Third song', premiere: '1988.07.23')

artist = Artist.new(name: 'Yamadu', birthdate: '1950.08.04', origin: 'Guinea')
artist1 = Artist.new(name: 'Bolokada', birthdate: '1968.12.01', origin: 'Guinea')
artist2 = Artist.new(name: 'Famoudou', birthdate: '1974.07.18', origin: 'Guinea')

artist.add_to_list(song)
artist.add_to_list(song1)
artist1.add_to_list(song1)
artist1.add_to_list(song2)

list = List.new('List')


list.add_to_artists(artist)
list.add_to_artists(artist1)
list.add_to_artists(artist2)
list.show_artists
list.delete_artist(artist)
list.show_artists
