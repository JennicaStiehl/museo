require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/photograph'
require './lib/artist'
require './lib/curator'

class CuratorTest < Minitest::Test

  def test_it_exists
    curator = Curator.new

    assert_instance_of Curator, curator
  end

  def test_it_starts_without_artists
    curator = Curator.new

    assert_equal [], curator.artists
  end

  def test_it_starts_without_photographs
    curator = Curator.new

    assert_equal [], curator.photographs
  end

  def test_it_can_add_photographs
    curator = Curator.new
    attributes_1 = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    }
    photo_1 = Photograph.new(attributes_1)
    attributes = {
      id: "2",
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"
    }
    photo_2 = Photograph.new(attributes)
    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)
    assert_equal [photo_1, photo_2], curator.photographs
    #=> [#<Photograph:0x00007fd3a10cda60...>, #<Photograph:0x00007fd3a1801278...>]
  end

  def test_it_can_grab_the_first_photo
    curator = Curator.new
    attributes_1 = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    }
    photo_1 = Photograph.new(attributes_1)
    attributes = {
      id: "2",
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"
    }
    photo_2 = Photograph.new(attributes)
    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)
    assert_equal photo_1, curator.photographs.first
    #=> #<Photograph:0x00007fd3a10cda60 @artist_id="1", @id="1", @name="Rue Mouffetard, Paris (Boy with Bottles)", @year="1954">
  end

  def test_it_can_get_the_name_of_first_photo
    curator = Curator.new
    attributes_1 = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    }
    photo_1 = Photograph.new(attributes_1)
    attributes = {
      id: "2",
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"
    }
    photo_2 = Photograph.new(attributes)
    curator.add_photograph(photo_1)
    curator.add_photograph(attributes)
    assert_equal "Rue Mouffetard, Paris (Boy with Bottles)", curator.photographs.first.name
  end

  def test_it_can_add_artists
    curator = Curator.new
    artist_attributes_1 = {
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
    }
    artist_1 = Artist.new(artist_attributes_1)
    artist_attributes_2 = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }
    artist_2 = Artist.new(artist_attributes_2)
    curator.add_artist(artist_1)
    curator.add_artist(artist_2)
    assert_equal [artist_1, artist_2], curator.artists
    #=> [#<Artist:0x00007fd3a02a8890...>, #<Artist:0x00007fd3a02d3130...>]
  end

  def test_it_can_get_first_artist
    curator = Curator.new
    artist_attributes_1 = {
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
    }
    artist_1 = Artist.new(artist_attributes_1)
    artist_attributes_2 = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }
    artist_2 = Artist.new(artist_attributes_2)
    curator.add_artist(artist_1)
    curator.add_artist(artist_2)

    assert_equal artist_1, curator.artists.first
  end

  def test_it_can_get_name_of_first_artist
    curator = Curator.new
    artist_attributes_1 = {
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
    }
    artist_1 = Artist.new(artist_attributes_1)
    artist_attributes_2 = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }
    artist_2 = Artist.new(artist_attributes_2)
    curator.add_artist(artist_1)
    curator.add_artist(artist_2)
  assert_equal "Henri Cartier-Bresson", curator.artists.first.name
  end

  def test_it_can_find_artist_by_id_1
    curator = Curator.new
    artist_attributes_1 = {
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
    }
    artist_1 = Artist.new(artist_attributes_1)
    artist_attributes_2 = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }
    artist_2 = Artist.new(artist_attributes_2)
    curator.add_artist(artist_1)
    curator.add_artist(artist_2)

    assert_equal artist_1, curator.find_artist_by_id("1")
    #=> #<Artist:0x00007fd3a02a8890 @born="1908", @country="France", @died="2004", @id="1", @name="Henri Cartier-Bresson">
  end

  def test_it_can_find_photograph_by_id_2
    curator = Curator.new
    attributes_1 = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    }
    photo_1 = Photograph.new(attributes_1)
    attributes = {
      id: "2",
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"
    }
    photo_2 = Photograph.new(attributes)
    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)
    assert_equal photo_2, curator.find_photograph_by_id("2")
  #=> #<Photograph:0x00007fd3a1801278 @artist_id="2", @id="2", @name="Moonrise, Hernandez", @year="1941">
end
end
