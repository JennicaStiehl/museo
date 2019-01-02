class Curator
  attr_reader   :artists,
                :photographs

  def initialize
    @artists = []
    @photographs = []
  end

  def add_photograph(attributes)
    @photographs << attributes
  end

  def add_artist(attributes)
    @artists << (attributes)
  end

  def find_artist_by_id(id)
    @artists.find do |artist|
      artist.id == id
    end
  end

  def find_photograph_by_id(id)
    @photographs.find do |photo|
      photo.id == id
    end
  end
end