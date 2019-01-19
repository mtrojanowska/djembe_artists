class Artist
  attr_accessor :name, :birthdate, :origin

  def initialize(name, birthdate, origin)
    @name = name
    @birthdate = birthdate
    @origin = origin
  end

  def update_name(name)
    @name = name
  end

  def update_birthdate(birthdate)
    @birthdate = birthdate
  end

  def update_origin(origin)
    @origin = origin
  end


end
