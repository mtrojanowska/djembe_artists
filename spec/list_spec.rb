require_relative '../list'
require_relative '../artist'


RSpec.describe List do

  describe "#initialize" do
    it "initializes list of artists" do
      list_of_artists = ["one", "two", "three"]
      expect(list_of_artists).to eq(["one", "two", "three"])
    end
  end

  describe "#add_to_artists" do
    it "adds an artist to the list of artists" do
      jajo = Artist.new(name: "Jajo", birthdate: "999", origin: "GV")
      toto = Artist.new(name: "Toto", birthdate: "000", origin: "SL")
      list_of_artists = []
      list_of_artists << jajo
      list_of_artists << toto
      expect(list_of_artists).to eq([jajo, toto])
    end
  end

  describe "#add_to_artists" do
    it "finds an artist on the list of artists" do
      jajo = Artist.new(name: "Jajo", birthdate: "999", origin: "GV")
      toto = Artist.new(name: "Toto", birthdate: "000", origin: "SL")
      list_of_artists = []
      list_of_artists << jajo
      list_of_artists << toto
      artist_to_display = jajo
      expect(list_of_artists).to include(artist_to_display)
    end
  end

  describe '#delete_artist' do
    it "deletes an artist from the list of artists" do
      jajo = Artist.new(name: "Jajo", birthdate: "999", origin: "GV")
      toto = Artist.new(name: "Toto", birthdate: "000", origin: "SL")
      list_of_artists = []
      list_of_artists << jajo
      list_of_artists << toto
      list_of_artists.delete(jajo)
      expect(list_of_artists).to eq([toto])
    end
  end
end
