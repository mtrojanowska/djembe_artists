# frozen_string_literal: true

require_relative 'artist'
require_relative 'song'
require_relative 'list'

def song_menu(list, artist)
  p '-------------------------------------------------------------'
  puts "1. Add a Song to an Artist\n2. Edit a Song\n3. Delete a Song\n4. Back to main menu"
  p '-------------------------------------------------------------'
  song_menu_choice = gets.chomp.to_i
  if song_menu_choice == 1
    p 'Song title:'
    song_title = gets.chomp
    p 'Date of release:'
    song_release = gets.chomp
    song = Song.new(title: song_title, premiere: song_release)
    artist.add_to_artists_song_list(song)
    list.show_artist(artist)
    main_menu(list)
  elsif song_menu_choice == 2
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
  elsif song_menu_choice == 3
    p 'What song You want to delete?'
    song_to_delete = gets.chomp
    song = artist.find_song(song_to_delete)
    artist.delete_song(song)
    list.show_artist(artist)
    song_menu(list, artist)
  elsif song_menu_choice == 4
    main_menu(list)
  else
    p 'Wrong input. Try again'
    song_menu(list, artist)
  end
 end


def choosing_artist(list)
  artist_to_display = gets.chomp
  if artist = list.find_artist(artist_to_display)
    list.show_artist(artist)
    song_menu(list, artist)
  else
    p 'Try again'
    main_menu(list)
  end
end

def main_menu(list)
  p '-------------------------------------------------------------'
  menu = "1. Add an Artist\n2. Display an Artist\n3. Show all Artists\n4. Edit an artist\n5. Delete an artist\n6. Quit the program"
  puts menu
  p '-------------------------------------------------------------'
  main_menu_choice = gets.chomp.to_i
  if main_menu_choice == 1
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
  elsif main_menu_choice == 2
    p 'What Artist you desire to see?'
    choosing_artist(list)
  elsif main_menu_choice == 3
    p 'All Artists'
    list.show_artists
    main_menu(list)
  elsif main_menu_choice == 4
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
  elsif main_menu_choice == 5
    p 'What artist You want to delete?'
    required_artist = gets.chomp
    artist = list.find_artist(required_artist)
    list.delete_artist(artist)
    list.show_artists
    main_menu(list)
  elsif main_menu_choice == 6
    exit
  else
    main_menu(list)
  end
end

list = List.new('list')


main_menu(list)
