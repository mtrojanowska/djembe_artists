require_relative '../artist'
require_relative '../song'
RSpec.describe Artist do

  describe "something" do

    before(:each) do
      @artist = Artist.new(name: "Jajo", birthdate: "999", origin: "GV")
    end

    it "checks the artist's name" do
      expect(@artist.name).to eq("Jajo")
    end

    it "checks the artist's birthdate" do
      expect(@artist.birthdate).to eq("999")
    end

    it "checks the artist's origin" do
      expect(@artist.origin).to eq("GV")
    end

    it "updates the artist's name" do
      @artist.update(name: "Jaja", birthdate: "2000", origin: "US")
      expect(@artist.name).to eq("Jaja")
    end

    it "updates the artist's birthdate" do
      @artist.update(name: "Jaja", birthdate: "2000", origin: "US")
      expect(@artist.birthdate).to eq("2000")
    end

    it "updates the artist's origin" do
      @artist.update(name: "Jaja", birthdate: "2000", origin: "US")
      expect(@artist.origin).to eq("US")
    end


    before(:each) do
      @song = Song.new(title: "First song", premiere: "00")
      @song1 = Song.new(title: "1 song", premiere: "00")
      @artist = Artist.new(name: "Jajo", birthdate: "999", origin: "GV")
      @artist.songs_list << @song.title
      @artist.songs_list << @song1.title
    end

    it "finds song in artists songs list" do
      # song = Song.new(title: "First song", premiere: "00")
      # song1 = Song.new(title: "1 song", premiere: "00")
      # artist = Artist.new(name: "Jajo", birthdate: "1999", origin: "GV")
      # artist.songs_list << song.title
      # artist.songs_list << song1.title
      song_to_display = "First song"
      expect(@artist.songs_list).to include(song_to_display)
    end

    it "adds song to artists song list" do
      # song = Song.new(title: "First song", premiere: "00")
      # song1 = Song.new(title: "1 song", premiere: "00")
      # artist = Artist.new(name: "Jajo", birthdate: "1999", origin: "GV")
      # artist.songs_list << song.title
      # artist.songs_list << song1.title
      expect(@artist.songs_list).to eq(["First song", "1 song"])
    end

    it "deletes song from songs list" do
      # song = Song.new(title: "First song", premiere: "00")
      # song1 = Song.new(title: "1 song", premiere: "00")
      # artist = Artist.new(name: "Jajo", birthdate: "1999", origin: "GV")
      # artist.songs_list << song.title
      # artist.songs_list << song1.title
      @artist.songs_list.delete(@song.title)
      expect(@artist.songs_list).to eq(["1 song"])
    end

  end
end
