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

  def find_photographs_by_artist(artist)
    @photographs.find do |photo|
      photo.artist_id == artist.id
    end
  end

  def artists_with_multiple_photographs
    artists = []
    id = @photographs.count do |photo|
      photo.artist_id.to_i > 1
    end.to_s
    artists << find_artist_by_id(id)
  end

  def photographs_taken_by_artist_from(country)
    art_group = @artists.find_all do |artist|
      artist.country == country
    end
    artist_ids = []
    art_group.each do |artist|
      artist_ids << artist.id
    end
    photo_ids = artist_ids.each do |artist_id|
      @photographs.find_all do |photo|
        photo.artist_id == artist_id
      end
    end
    photo_ids.map do |id|
      find_photograph_by_id(id)
    end
  end
end
