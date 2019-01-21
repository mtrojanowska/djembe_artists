require_relative 'artist'
require_relative 'song'
require_relative 'djembe'

song = Song.new(title: "First song", premiere: "1998.11.04")

artist = Artist.new(name: "Yamadu", birthdate: "1950.08.04", origin: "Guinea", songs_list: "complete_list")
artist1 = Artist.new(name: "Bolokada", birthdate: "1968.12.01", origin: "Guinea", songs_list: "complete_list")
artist2 = Artist.new(name: "Famoudou", birthdate: "1974.07.18", origin: "Guinea", songs_list: "complete_list")

artist.add_to_lists(artist,"First song")
artist.add_to_lists(artist,"Second song")
artist.add_to_lists(artist1,"2First song")
artist.add_to_lists(artist1,"2Second song")
artist.add_to_lists(artist2,"2First song")
artist.add_to_lists(artist2,"2Second song")


list = List.new("List")

#list.delete(artist, "Yamadu")

list.delete_song(artist, "First song")
list.output_complete_list(artist)
