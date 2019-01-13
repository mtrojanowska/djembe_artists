
class Artist
  attr_accessor :name, :songs_list

  def initialize(name, songs_list)
    @name = name
    @songs_list = []
  end

  def create(artist)
    @artist = artist
    @artist.name
  end

  def update(name)
    @name = name
  end

  def songs_list(song)
    @songs_list << song
    @songs_list
  end

  def output_songs_list
    @songs_list.each do |song|
      p song
    end
  end
end

class Song
  attr_accessor :title

  def initialize(title)
    @title = title
  end

  def create
    @song = song
    @song.title
  end
end

class List
  attr_accessor :list_of_artists, :complete_list, :artist, :song, :songs_list

  def initialize(list, complete_list)
    @list_of_artists = []
    @complete_list = Hash.new {|h, k| h[k] = [] }
  end

  def list_of_artists(artist)
    @list_of_artists.push(artist)
  end

  def output_list_of_artists
    @list_of_artists.each.with_index do |artist, i|
      print i+1
      p artist.name
    end
  end

  def list_of_artist_songs(artist)
    p "#{artist.name}\'s list of songs:"
     artist.songs_list(song).each.with_index do |song, i|
        print i+1
        p song
     end
  end

  def add_to_complete_list(artist, song)
    @complete_list[artist]<<song
    @complete_list
  end

  def output_complete_list
     @complete_list.each do |artist, songs|
       p "#{artist.name} recorded:"
       songs.each do |song |
       p "#{song}"
     end
    end
  end

  def delete_artist(artist)
    @list_of_artists.delete(artist)
    @list_of_artists
  end


    def delete_song(artist, song)
      artist.songs_list(song).delete(song)
      artist.output_songs_list
    end


end

first_artist = Artist.new("First_artist","First_artists_songs")
second_artist = Artist.new("Second_artist", "Secong_artists_songs")

first_artist.songs_list("1First song")
first_artist.songs_list("1Second song")
first_artist.songs_list("1Third song")

second_artist.songs_list("2First song")
second_artist.songs_list("2Second song")
second_artist.songs_list("2Third song")
second_artist.songs_list("2Fourth song")


list = List.new("List of Artists", "Complete list")
list.list_of_artists(first_artist)
list.list_of_artists(second_artist)

list.delete_song(second_artist, "2First song")
