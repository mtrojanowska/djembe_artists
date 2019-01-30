# frozen_string_literal: true

require_relative 'artist'
require_relative 'song'
require_relative 'list'
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

loop do
  loop do
    loop do
      loop do
        puts "1. Show all Artists\n2. Show an Artist\n3. Add an Artist\n4. Quit the program"
        input1 = gets.chomp.to_i

        if input1 == 1
          p 'All Artists'
          list.show_artists
        elsif input1 == 2
          p 'What Artist you desire to see?'
          required_artist = gets.chomp
          if required_artist == artist.name
            list.output_list(artist)
          else
            p 'No such artist'
            break
        end

          loop do
            loop do
              puts "1. Edit an Artist\n2. Add a Song to an Artist\n3. Edit a Song\n4. Delete a Song\n5. Delete an Artist\n6. Back"
              input2 = gets.chomp.to_i
              if input2 == 1
                p 'Edit an Artist'\
                       'Change the Name:'
                changed_name = gets.chomp
                p 'Change the Date of Birth:'
                changed_birthdate = gets.chomp
                p 'Change the Country of Origin:'
                changed_origin = gets.chomp
                artist.update(name: changed_name, birthdate: changed_birthdate, origin: changed_origin)
                list.output_list(artist)
              elsif input2 == 2
                p 'Song Title:'
                song_title = gets.chomp
                p 'Released:'
                song_premiere = gets.chomp
                song = Song.new(title: song_title, premiere: song_premiere)
                artist.add_to_list(song)
                list.output_list(artist)
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
              elsif input2 == 4
                p 'What song You want to delete?'
                required_song = gets.chomp.capitalize!
                artist.delete_song(required_song)
                list.output_list(artist)
              elsif input2 == 5
                list.delete_artist(artist)
                list.show_artists
              else input2 == 6
                   break
          end
            end
            break
          end

        elsif input1 == 3
          p "Artist's Name:"
          name_input = gets.chomp
          p 'Date of birth:'
          birthdate_input = gets.chomp
          p 'Country of origin:'
          origin_input = gets.chomp
          artist = Artist.new(name: name_input, birthdate: birthdate_input, origin: origin_input)
          list.add_to_artists(artist)
          loop do
            p 'Whant to add a song to an artist? Y/N'
            input3 = gets.chomp.capitalize!
                  if input3 == 'Y'
                  puts 'Add a song title:'
                  title = gets.chomp
                  p 'Add date of release:'
                  premiere = gets.chomp
                  song = Song.new(title: title, premiere: premiere)
                  artist.add_to_list(song)
                  list.output_list(artist)
                  else input3 == 'N'
              break
            end
          end
          p 'Artist has been included'
          list.show_artists
        else input1 == 4
             break
            end
      end
    end
    break
  end
  break
end
