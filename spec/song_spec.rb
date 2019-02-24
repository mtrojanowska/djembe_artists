require_relative '../song'
RSpec.describe Song do

  describe "#initialize" do
    it "sets the title of song" do
      song = Song.new(title: "Something", premiere: "00")
      expect(song.title).to eq("Something")
    end

    it "sets the premiere of song" do
      song = Song.new(title: "Something", premiere: "00")
      expect(song.premiere).to eql("00")
    end
  end

  describe "#update" do
    it "updates song title" do
      song = Song.new(title: "Something", premiere: "00")
      song.update(title: "1", premiere: "00")
      expect(song.title).to eq("1")
    end

    it "updates song premiere" do
      song = Song.new(title: "Something", premiere: "00")
      song.update(title: "1", premiere: "22")
      expect(song.premiere).to eq("22")
    end
  end
end
