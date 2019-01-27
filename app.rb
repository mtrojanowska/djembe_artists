# frozen_string_literal: true

require_relative 'artist'
require_relative 'song'
require_relative 'list'

p '1. Show all Artists  2. Show an Artist  3. Add an Artist  4. Quit the program'
input = gets.chomp.to_i
list = List.new('First_list')
artist = Artist.new(name: 'Bolocada', birthdate: '9879879', origin: 'Gwinea')

song = Song.new(title: 'First song', premiere: '2000')
list.add_to_artists(artist)
artist.add_to_list(song)

if input == 1
  p 'All Artists'
  list.show_artists
elsif input == 2
  p 'What Artist you desire to see?'
  required_artist = gets.chomp
  list.output_list(artist) if required_artist == artist.name
  p '1. Edit an Artist  2. Add a Song to an Artist 3. Edit a Song  4. Delete a Song  5. Delete an Artist  6.Back'
  input = gets.chomp.to_i
  if input == 1
    p 'Edit an Artist'
    p 'Change the Name:'
    changed_name = gets.chomp.capitalize!
    p 'Change the Date of Birth:'
    changed_birthdate = gets.chomp
    p 'Change the Country of Origin:'
    changed_origin = gets.chomp
    artist.update(name: changed_name, birthdate: changed_birthdate, origin: changed_origin)
    list.output_list(artist)
  elsif input == 2
    p 'Song Title:'
    song_title = gets.chomp
    p 'Released:'
    song_premiere = gets.chomp
    song = Song.new(title: song_title, premiere: song_premiere)
    artist.add_to_list(song)
    list.output_list(artist3)
  elsif input == 3
    p 'Choose the Song:'
    required_song = gets.chomp.capitalize!
    p 'Change the Title'
    changed_title = gets.chomp.capitalize!
    p 'Change the date of release:'
    changed_premiere = gets.chomp
    if required_song == song.title
      song.update(title: changed_title, premiere: changed_premiere)
    end
    list.output_list(artist)
  elsif input == 4
    p 'What song You want to delete?'
    required_song = gets.chomp.capitalize!
    artist.delete_song(required_song)
    list.output_list(artist)
  elsif input == 5
    list.delete_artist(artist)
    list.show_artists
  end

elsif input == 3
  p "Artist's Name:"
  name_input = gets.chomp
  p 'Date of birth:'
  birthdate_input = gets.chomp
  p 'Country of origin:'
  origin_input = gets.chomp
  artist = Artist.new(name: name_input, birthdate: birthdate_input, origin: origin_input)
  list.add_to_artists(artist)
  list.output_list(artist)
  list.show_artists
end
