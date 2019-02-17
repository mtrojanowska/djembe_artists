# frozen_string_literal: true

require_relative 'song'

def song_menu(artist)
  p '-------------------------------------------------------------'
  puts "1. Add a Song to an Artist\n2. Edit a Song\n3. Delete a Song\n4. Back to main menu"
  p '-------------------------------------------------------------'
  song_menu_choice = gets.chomp.to_i
  case song_menu_choice
  when 1
    add_song(artist)
    show
  when 2
    update_song(artist)
  when 3
    delete_song(artist)
  when 4
    show
  else
    p 'Wrong input. Try again'
    song_menu(artist)
  end
end

def add_song(artist)
  p 'Song title:'
  song_title = gets.chomp
  p 'Date of release:'
  song_release = gets.chomp
  song = Song.new(title: song_title, premiere: song_release)
  artist.add_to_artists_song_list(song)
  @list.show_artist(artist)
end

def update_song(artist)
  p 'Choose the Song:'
  required_song = gets.chomp
  if song = artist.find_song(required_song)
    p 'Change the Title'
    changed_title = gets.chomp
    p 'Change the date of release:'
    changed_premiere = gets.chomp
    song.update(title: changed_title, premiere: changed_premiere)
    @list.show_artist(artist)
    song_menu(artist)
  else
    p 'Wrong title'
    song_menu(artist)
  end
end

def delete_song(artist)
  p 'What song You want to delete?'
  song_to_delete = gets.chomp
  if song = artist.find_song(song_to_delete)
    artist.delete_song(song)
    @list.show_artist(artist)
    song_menu(artist)
  else
    p 'No such song'
    delete_song(artist)
  end
end
