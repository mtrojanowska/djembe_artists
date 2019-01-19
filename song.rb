
class Song
  attr_accessor :title, :premiere

  def initialize(title, premiere)
    @title = title
    @premiere = premiere
  end

  def create(song)
    @song = song
  end
end
