# frozen_string_literal: true

require_relative 'song'

class SongMenu
  def initialize(list:, artist:)
    @list = list
    @artist = artist
  end

  def show_song_menu
    p '-------------------------------------------------------------'
    puts "1. Add a Song to an Artist\n2. Edit a Song\n3. Delete a Song\n4. Back to main menu"
    p '-------------------------------------------------------------'
    song_menu_choice = gets.chomp.to_i
    case song_menu_choice
    when 1
      add_song
      show_song_menu
    when 2
      update_song
    when 3
      delete_song
    when 4

    else
      p 'Wrong input. Try again'
      show_song_menu
    end
  end

  def add_song
    p 'Song title:'
    song_title = gets.chomp
    p 'Date of release:'
    song_release = gets.chomp
    song = Song.new(title: song_title, premiere: song_release)
    @artist.add_to_artists_song_list(song)
    @list.show_artist(@artist)
  end

  def update_song
    p 'Choose the Song:'
    required_song = gets.chomp
    if song = @artist.find_song(required_song)
      p 'Change the Title'
      changed_title = gets.chomp
      p 'Change the date of release:'
      changed_premiere = gets.chomp
      song.update(title: changed_title, premiere: changed_premiere)
      @list.show_artist(@artist)
      show_song_menu
    else
      p 'Wrong title'
      show_song_menu
    end
  end

  def delete_song
    p 'What song You want to delete?'
    song_to_delete = gets.chomp
    if song = @artist.find_song(song_to_delete)
      @artist.delete_song(song)
      @list.show_artist(@artist)
      show_song_menu
    else
      p 'No such song'
      delete_song
    end
  end
end
