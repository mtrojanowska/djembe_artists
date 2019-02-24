require_relative '../artist'
require_relative '../song'
RSpec.describe Artist do

  describe "#initialize" do
    it "sets the artist's name" do
      artist = Artist.new(name: "Jajo", birthdate: "999", origin: "GV")
      expect(artist.name).to eq("Jajo")
    end

    it "sets the artist's birthdate" do
      artist = Artist.new(name: "Jajo", birthdate: "999", origin: "GV")
      expect(artist.birthdate).to eq("999")
    end

    it "sets the artist's origin" do
      artist = Artist.new(name: "Jajo", birthdate: "999", origin: "GV")
      expect(artist.origin).to eq("GV")
    end
  end


  describe "#update" do
    it "updates the artist's name" do
      artist = Artist.new(name: "Jajo", birthdate: "999", origin: "GV")
      artist.update(name: "Jaja", birthdate: "2000", origin: "US")
      expect(artist.name).to eq("Jaja")
    end

    it "updates the artist's birthdate" do
      artist = Artist.new(name: "add_to_artists_song_listJajo", birthdate: "999", origin: "GV")
      artist.update(name: "Jaja", birthdate: "2000", origin: "US")
      expect(artist.birthdate).to eq("2000")
    end

    it "updates the artist's origin" do
      artist = Artist.new(name: "Jajo", birthdate: "999", origin: "GV")
      artist.update(name: "Jaja", birthdate: "2000", origin: "US")
      expect(artist.origin).to eq("US")
    end
  end


  describe "#find_song" do
    it "finds a song in artist's list of songs" do
      first_song = Song.new(title: "First song", premiere: "00")
      second_song = Song.new(title: "1 song", premiere: "00")
      artist = Artist.new(name: "Jajo", birthdate: "1999", origin: "GV")
      artist.songs_list << first_song.title
      artist.songs_list << second_song.title
      song_to_display = "First song"
      expect(artist.songs_list).to include(song_to_display)
    end
  end

  describe "#add_to_artists_song_list" do
    it "adds a song to artist's list of songs" do
      first_song = Song.new(title: "First song", premiere: "00")
      second_song = Song.new(title: "1 song", premiere: "00")
      artist = Artist.new(name: "Jajo", birthdate: "1999", origin: "GV")
      artist.songs_list << first_song
      artist.songs_list << second_song
      expect(artist.songs_list).to eq([first_song, second_song])
    end
  end

 describe "#delete_song" do
    it "deletes a song from artist's list of songs" do
      first_song = Song.new(title: "First song", premiere: "00")
      second_song = Song.new(title: "1 song", premiere: "00")
      artist = Artist.new(name: "Jajo", birthdate: "1999", origin: "GV")
      artist.songs_list << first_song
      artist.songs_list << second_song
      artist.songs_list.delete(first_song)
      expect(artist.songs_list).to eq([second_song])
    end
  end
end