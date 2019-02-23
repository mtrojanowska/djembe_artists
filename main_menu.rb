# frozen_string_literal: true

require_relative 'artist'
require_relative 'song_menu'

class MainMenu
  def initialize(list:)
    @list = list
  end

  def show
    p '-------------------------------------------------------------'
    menu = "1. Add an Artist\n2. Display an Artist\n3. Show all Artists\n4. Edit an artist\n5. Delete an artist\n6. Quit the program"
    puts menu
    p '-------------------------------------------------------------'

    show_choice = gets.chomp.to_i
    case show_choice
    when 1
      @list.add_to_artists(add_artist)
      show
    when 2
      p 'What Artist you desire to see?'
      choose_artist
      show
    when 3
      p 'All Artists'
      @list.show_artists
      show
    when 4
      @list.show_artist(update_artist)
      show
    when 5
      delete_artist
      @list.show_artists
      show
    when 6
      exit
    else
      show
    end
  end

  def add_artist
    p 'Add an Artist'
    p "Artist's Name:"
    name_input = gets.chomp
    p 'Date of birth:'
    birthdate_input = gets.chomp
    p 'Country of origin:'
    origin_input = gets.chomp
    Artist.new(name: name_input, birthdate: birthdate_input, origin: origin_input)
  end

  def choose_artist
    artist_to_display = gets.chomp
    if artist = @list.find_artist(artist_to_display)
      @list.show_artist(artist)
      list = @list
      song_menu = SongMenu.new(list: list, artist: artist)
      song_menu.show_song_menu
    else
      p 'Try again'
      show
    end
  end

  def update_artist
    p 'What artist You want to edit?'
    artist_to_update = gets.chomp
    if artist = @list.find_artist(artist_to_update)
      puts 'Change the Name:'
      changed_name = gets.chomp
      p 'Change the Date of Birth:'
      changed_birthdate = gets.chomp
      p 'Change the Country of Origin:'
      changed_origin = gets.chomp
      artist = @list.find_artist(artist_to_update)
      artist.update(name: changed_name, birthdate: changed_birthdate, origin: changed_origin)
      artist
    else
      p 'Wrong name'
      update_artist
    end
  end

  def delete_artist
    p 'What artist You want to delete?'
    required_artist = gets.chomp
    if artist = @list.find_artist(required_artist)
      @list.delete_artist(artist)
    else
      p 'Wrong artist'
      delete_artist
    end
  end
end
