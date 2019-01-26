# frozen_string_literal: true

class Song
  attr_accessor :title, :premiere


  def initialize(title:, premiere:)
    @title = title
    @premiere = premiere
  end

  def update(title:, premiere:)
    @title = title
    @premiere = premiere
  end
end
