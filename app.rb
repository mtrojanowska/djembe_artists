# frozen_string_literal: true

require_relative 'artist'
require_relative 'song'
require_relative 'list'

def song_menu(list, artist)
  p '-------------------------------------------------------------'
  puts "1. Add a Song to an Artist\n2. Edit a Song\n3. Delete a Song\n4. Back to main menu"
  p '-------------------------------------------------------------'
  input2 = gets.chomp.to_i
  if input2 == 1
    p 'Song title:'
    song_title = gets.chomp
    p 'Date of release:'
    song_release = gets.chomp
    song = Song.new(title: song_title, premiere: song_release)
    artist.add_to_artists_song_list(song)
    list.show_artist(artist)
    main_menu(list)
  elsif input2 == 2
    p 'Choose the Song:'
    required_song = gets.chomp
    if song = artist.find_song(required_song)
      p 'Change the Title'
      changed_title = gets.chomp
      p 'Change the date of release:'
      changed_premiere = gets.chomp
      song.update(title: changed_title, premiere: changed_premiere)
      list.show_artist(artist)
      song_menu(list, artist)
    else
      p 'Wrong title'
      song_menu(list, artist)
    end
  elsif input2 == 3
    p 'What song You want to delete?'
    song_to_delete = gets.chomp
    song = artist.find_song(song_to_delete)
    artist.delete_song(song)
    list.show_artist(artist)
    song_menu(list, artist)
  elsif input2 == 4
    main_menu(list)
  else
    p 'Wrong input. Try again'
    song_menu(list)
  end
 end

def add_song(list, artist)
  p 'Want to add a song to an artist? Y/N'
  input3 = gets.chomp.capitalize!
  if input3 == 'Y'
    puts 'Add a song title:'
    title = gets.chomp
    p 'Add date of release:'
    premiere = gets.chomp
    song = Song.new(title: title, premiere: premiere)
    artist.add_to_list(song)
    list.show_artist(artist)
    add_song(list, artist)
  else input3 == 'N'
  end
end

def choosing_artist(list)
  artist_to_display = gets.chomp
  if artist = list.find_artist(artist_to_display)
    list.show_artist(artist)
    song_menu(list, artist)
  else artist != list.find_artist(artist_to_display)
       p 'Try again'
       main_menu(list)
  end
end

def main_menu(list)
  p '-------------------------------------------------------------'
  menu = "1. Add an Artist\n2. Display an Artist\n3. Show all Artists\n4. Edit an artist\n5. Delete an artist\n6. Quit the program"
  puts menu
  p '-------------------------------------------------------------'
  input1 = gets.chomp.to_i
  if input1 == 1
    p 'Add an Artist'
    p "Artist's Name:"
    name_input = gets.chomp
    p 'Date of birth:'
    birthdate_input = gets.chomp
    p 'Country of origin:'
    origin_input = gets.chomp
    artist = Artist.new(name: name_input, birthdate: birthdate_input, origin: origin_input)
    list.add_to_artists(artist)
    main_menu(list)
  elsif input1 == 2
    p 'What Artist you desire to see?'
    choosing_artist(list)
  elsif input1 == 3
    p 'All Artists'
    list.show_artists
    main_menu(list)
  elsif input1 == 4
    p 'What artist You want to edit?'
    artist_to_update = gets.chomp
    puts 'Change the Name:'
    changed_name = gets.chomp
    p 'Change the Date of Birth:'
    changed_birthdate = gets.chomp
    p 'Change the Country of Origin:'
    changed_origin = gets.chomp
    artist = list.find_artist(artist_to_update)
    artist.update(name: changed_name, birthdate: changed_birthdate, origin: changed_origin)
    list.show_artist(artist)
    main_menu(list)

  elsif input1 == 5
    p 'What artist You want to delete?'
    required_artist = gets.chomp
    artist = list.find_artist(required_artist)
    list.delete_artist(artist)
    list.show_artists
    main_menu(list)

  elsif input1 == 6
    exit
  else
    main_menu(list)
  end
end

list = List.new('list')
artist = Artist.new(name: 'Yamadu', birthdate: '00', origin: 'USA')
song = Song.new(title: 'First song', premiere: '99')

main_menu(list)
