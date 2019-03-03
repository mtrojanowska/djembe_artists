require_relative '../list'
require_relative '../artist'

RSpec.describe List do

 describe "#add_to_artists" do
    it "adds an artist to the list of artists" do
      jajo = Artist.new(name: "Jajo", birthdate: "999", origin: "GV")
      toto = Artist.new(name: "Toto", birthdate: "000", origin: "SL")
      list = List.new
      list.add_to_artists(jajo)
      list.add_to_artists(toto)
      expect(list.list_of_artists).to eq([jajo, toto])
    end
  end

  describe "#find_artist" do
    it "finds an artist on the list of artists" do
      jajo = Artist.new(name: "Jajo", birthdate: "999", origin: "GV")
      toto = Artist.new(name: "Toto", birthdate: "000", origin: "SL")
      list = List.new
      list.add_to_artists(jajo)
      list.add_to_artists(toto)
      artist_to_display = list.find_artist(jajo.name)
      expect(artist_to_display).to eq(jajo)
    end
  end


  describe '#delete_artist' do
    it "deletes an artist from the list of artists" do
      jajo = Artist.new(name: "Jajo", birthdate: "999", origin: "GV")
      toto = Artist.new(name: "Toto", birthdate: "000", origin: "SL")
      list = List.new
      list.add_to_artists(jajo)
      list.add_to_artists(toto)
      artist_to_display = jajo
      list.delete_artist(jajo)
      expect(list.list_of_artists).to eq([toto])
    end
  end
end
