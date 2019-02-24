require_relative '../list'
require_relative '../artist'
require_relative '../song'

RSpec.describe List do
  describe "list methods" do

    before(:each) do
      @artist = Artist.new(name: "Jajo", birthdate: "999", origin: "GV")
      @artist1 = Artist.new(name: "Toto", birthdate: "000", origin: "SL")
    end

    it "initializes list of artists" do
      list_of_artists = ["one", "two", "three"]
      expect(list_of_artists).to eq(["one", "two", "three"])
    end

    it "adds artist to the list of artists" do
      list_of_artists = []
      list_of_artists << @artist.name
      list_of_artists << @artist1.name
      expect(list_of_artists).to eq(["Jajo", "Toto"])

      # @list_of_artists << @artist
      # @list_of_artists << @artist1
      # expect(@list_of_artists).to eq([@artist, @artist1])
    end

    before(:each) do
      @list_of_artists = []
      @artist = Artist.new(name: "Jajo", birthdate: "999", origin: "GV")
      @artist1 = Artist.new(name: "Toto", birthdate: "000", origin: "SL")
      @list_of_artists << @artist
      @list_of_artists << @artist1
    end

    it "finds an artist" do
      artist_to_display = @artist
      expect(@list_of_artists).to include(artist_to_display)
    end

    it "deletes an artist" do
      @list_of_artists.delete(@artist)
      expect(@list_of_artists).to eq([@artist1])
    end




  end
end
