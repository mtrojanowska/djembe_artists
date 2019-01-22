require_relative 'artist'
require_relative 'song'
require_relative 'list'

song = Song.new(title: "First song", premiere: "1998.11.04")

artist = Artist.new(name: "Yamadu", birthdate: "1950.08.04", origin: "Guinea")

artist1 = Artist.new(name: "Bolokada", birthdate: "1968.12.01", origin: "Guinea")
artist2 = Artist.new(name: "Famoudou", birthdate: "1974.07.18", origin: "Guinea")

artist2.update(name: "Famoudou_one", birthdate: "1975.07.18", origin: "G")
#p artist2.name

artist.add_to_lists("First song")
artist.add_to_lists("Second song")
artist1.add_to_lists("1First song")
artist1.add_to_lists("1Second song")

list = List.new("List")
artist.delete_song("First song")
list.output_list(artist)

list.delete_artist(artist)
p list

#list.delete(artist, "Yamadu")

#list.output_list(artist1)
