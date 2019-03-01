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


  # describe "#show_artist" do
  #   it "finds an artist on the list of artists" do
  #     jajo = Artist.new(name: "Jajo", birthdate: "999", origin: "GV")
  #     toto = Artist.new(name: "Toto", birthdate: "000", origin: "SL")
  #     first_song = Song.new(title: "First song", premiere: "00")
  #     second_song = Song.new(title: "1 song", premiere: "00")
  #     jajo.add_to_artists_song_list(first_song)
  #     jajo.add_to_artists_song_list(second_song)
  #     list = List.new
  #     list.add_to_artists(jajo)
  #     list.add_to_artists(toto)
  #     artist_to_show = jajo
  #     expect(list.show_artist(jajo)).to eq(artist_to_show.songs_list)
  #   end
  # end

  # describe "#show_artists" do
  #    it "show all artists on the list" do
  #      jajo = Artist.new(name: "Jajo", birthdate: "999", origin: "GV")
  #      toto = Artist.new(name: "Toto", birthdate: "000", origin: "SL")
  #      list = List.new
  #      list.add_to_artists(jajo)
  #      list.add_to_artists(toto)
  #      expect(list.show_artists).to eq([jajo, toto])
  #    end
  #  end
