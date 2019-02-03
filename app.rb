# frozen_string_literal: true

require_relative 'artist'
require_relative 'song'
require_relative 'list'

def submenu
  list = List.new('LIST')
  song = Song.new(title: 'First song', premiere: '1998.11.04')
  song1 = Song.new(title: 'Second song', premiere: '1996.10.01')
  song2 = Song.new(title: 'Third song', premiere: '1988.07.23')

  artist = Artist.new(name: 'Yamadu', birthdate: '1950.08.04', origin: 'Guinea')
  artist1 = Artist.new(name: 'Bolokada', birthdate: '1968.12.01', origin: 'Guinea')
  artist2 = Artist.new(name: 'Famoudou', birthdate: '1974.07.18', origin: 'Guinea')
  artist.add_to_list(song)
  artist.add_to_list(song1)
  artist1.add_to_list(song2)

  list.add_to_artists(artist)
  list.add_to_artists(artist1)
  list.add_to_artists(artist2)

  p '-------------------------------------------------------------'
  puts "1. Edit an Artist\n2. Add a Song to an Artist\n3. Edit a Song\n4. Delete a Song\n5. Delete an Artist\n6. Back"
  p '-------------------------------------------------------------'
  input2 = gets.chomp.to_i
  if input2 == 1
    puts "Edit an Artist\nChange the Name:"
    changed_name = gets.chomp
    p 'Change the Date of Birth:'
    changed_birthdate = gets.chomp
    p 'Change the Country of Origin:'
    changed_origin = gets.chomp
    artist.update(name: changed_name, birthdate: changed_birthdate, origin: changed_origin)
    list.output_list(artist)
    submenu
  elsif input2 == 2
    add_song
    submenu
  elsif input2 == 3
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
    submenu
  elsif input2 == 4
    p 'What song You want to delete?'
    required_song = gets.chomp.capitalize!
    artist.delete_song(required_song)
    list.output_list(artist)
    submenu
  elsif input2 == 5
    list.delete_artist(artist)
    list.show_artists
    submenu
  elsif input2 == 6
    main_menu
  else
    p 'Wrong input. Try again'
    submenu
  end
 end

def add_song
  list = List.new('LIST')
  song = Song.new(title: 'First song', premiere: '1998.11.04')
  song1 = Song.new(title: 'Second song', premiere: '1996.10.01')
  song2 = Song.new(title: 'Third song', premiere: '1988.07.23')

  artist = Artist.new(name: 'Yamadu', birthdate: '1950.08.04', origin: 'Guinea')
  artist1 = Artist.new(name: 'Bolokada', birthdate: '1968.12.01', origin: 'Guinea')
  artist2 = Artist.new(name: 'Famoudou', birthdate: '1974.07.18', origin: 'Guinea')
  artist.add_to_list(song)
  artist.add_to_list(song1)
  artist1.add_to_list(song2)

  list.add_to_artists(artist)
  list.add_to_artists(artist1)
  list.add_to_artists(artist2)

  p 'Want to add a song to an artist? Y/N'
  input3 = gets.chomp.capitalize!
  if input3 == 'Y'
    puts 'Add a song title:'
    title = gets.chomp
    p 'Add date of release:'
    premiere = gets.chomp
    song = Song.new(title: title, premiere: premiere)
    artist.add_to_list(song)
    list.output_list(artist)
    add_song
  else input3 == 'N'
  end
end

def desired_artist
  list = List.new('LIST')
  song = Song.new(title: 'First song', premiere: '1998.11.04')
  song1 = Song.new(title: 'Second song', premiere: '1996.10.01')
  song2 = Song.new(title: 'Third song', premiere: '1988.07.23')

  artist = Artist.new(name: 'Yamadu', birthdate: '1950.08.04', origin: 'Guinea')
  artist1 = Artist.new(name: 'Bolokada', birthdate: '1968.12.01', origin: 'Guinea')
  artist2 = Artist.new(name: 'Famoudou', birthdate: '1974.07.18', origin: 'Guinea')
  artist.add_to_list(song)
  artist.add_to_list(song1)
  artist1.add_to_list(song2)

  list.add_to_artists(artist)
  list.add_to_artists(artist1)
  list.add_to_artists(artist2)

  p 'What Artist you desire to see?'
  required_artist = gets.chomp
  if
    required_artist == artist.name
    list.output_list(artist)
    p 'What next?'
    submenu
  else
    looping
  end
 end

def looping
  list = List.new('LIST')
  song = Song.new(title: 'First song', premiere: '1998.11.04')
  song1 = Song.new(title: 'Second song', premiere: '1996.10.01')
  song2 = Song.new(title: 'Third song', premiere: '1988.07.23')

  artist = Artist.new(name: 'Yamadu', birthdate: '1950.08.04', origin: 'Guinea')
  artist1 = Artist.new(name: 'Bolokada', birthdate: '1968.12.01', origin: 'Guinea')
  artist2 = Artist.new(name: 'Famoudou', birthdate: '1974.07.18', origin: 'Guinea')
  artist.add_to_list(song)
  artist.add_to_list(song1)
  artist1.add_to_list(song2)

  list.add_to_artists(artist)
  list.add_to_artists(artist1)
  list.add_to_artists(artist2)
  loop do
    p 'No such artist.Try again. Input the name or press Q to quit'
    required_artist = gets.chomp
    if required_artist == 'Q'
      main_menu
    elsif required_artist != artist.name
      looping
    else
      list.output_list(artist)
      p 'What next?'

  end
    break
  end
end

def main_menu
  list = List.new('LIST')
  song = Song.new(title: 'First song', premiere: '1998.11.04')
  song1 = Song.new(title: 'Second song', premiere: '1996.10.01')
  song2 = Song.new(title: 'Third song', premiere: '1988.07.23')

  artist = Artist.new(name: 'Yamadu', birthdate: '1950.08.04', origin: 'Guinea')
  artist1 = Artist.new(name: 'Bolokada', birthdate: '1968.12.01', origin: 'Guinea')
  artist2 = Artist.new(name: 'Famoudou', birthdate: '1974.07.18', origin: 'Guinea')
  artist.add_to_list(song)
  artist.add_to_list(song1)
  artist1.add_to_list(song2)

  list.add_to_artists(artist)
  list.add_to_artists(artist1)
  list.add_to_artists(artist2)

  p '-------------------------------------------------------------'
  puts "1. Show all Artists\n2. Show an Artist\n3. Add an Artist\n4. Quit the program"
  p '-------------------------------------------------------------'
  input1 = gets.chomp.to_i

  if input1 == 1
    p 'All Artists'
    list.show_artists
    p main_menu
  elsif input1 == 2
    desired_artist
    submenu
  elsif input1 == 3
    p 'Add an Artist'
    p "Artist's Name:"
    name_input = gets.chomp
    p 'Date of birth:'
    birthdate_input = gets.chomp
    p 'Country of origin:'
    origin_input = gets.chomp
    artist = Artist.new(name: name_input, birthdate: birthdate_input, origin: origin_input)
    list.add_to_artists(artist)
    add_song
    list.output_list(artist)
    submenu
  elsif input1 == 4

  else
    p 'Wrong input try again'
    input1 = gets.chomp.to_i
    submenu
  end
  end

main_menu
