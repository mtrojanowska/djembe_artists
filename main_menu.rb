

require_relative 'artist'
require_relative 'song'

class MainMenu
  def initialize(list:)
    @list = list
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
    when 3
      p 'All Artists'
      @list.show_artists
      show
    when 4
      update_artist
      show
    when 5
      delete_artist
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
    artist = Artist.new(name: name_input, birthdate: birthdate_input, origin: origin_input)
  end

  def choose_artist
    artist_to_display = gets.chomp
    if artist = @list.find_artist(artist_to_display)
      @list.show_artist(artist)
      song_menu(artist)
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
      @list.show_artist(artist)
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
      @list.show_artists
    else
      p 'Wrong artist'
      delete_artist
    end
  end
end
