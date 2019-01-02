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

  def test_it_can_find_photos_by_an_artist
    attributes_1 = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    }
    photo_1 = Photograph.new(attributes_1)
    attributes_2 = {
      id: "2",
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"
    }
    photo_2 = Photograph.new(attributes_2)
    attributes_3 = {
      id: "3",
      name: "Identical Twins, Roselle, New Jersey",
      artist_id: "3",
      year: "1967"
    }
    photo_3 = Photograph.new(attributes_3)
    attributes_4 = {
      id: "4",
      name: "Child with Toy Hand Grenade in Central Park",
      artist_id: "3",
      year: "1962"
    }
    photo_4 = Photograph.new(attributes_4)
    attributes_1 = {
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
    }
    artist_1 = Artist.new(attributes_1)
    attributes_2 = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }
    artist_2 = Artist.new(attributes_2)
    attributes_3 = {
      id: "3",
      name: "Diane Arbus",
      born: "1923",
      died: "1971",
      country: "United States"
    }
    artist_3 = Artist.new(attributes_3)
    curator = Curator.new
    #=> #<Curator:0x00007fa3c182da18...>
    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)
    curator.add_photograph(photo_3)
    curator.add_photograph(photo_4)
    curator.add_artist(artist_1)
    curator.add_artist(artist_2)
    curator.add_artist(artist_3)

    diane_arbus = curator.find_artist_by_id("3")
    #=> #<Artist:0x00007fa3c13eef88 @born="1923", @country="United States", @died="1971", @id="3", @name="Diane Arbus">
    expected = [photo_3, photo_4]
    curator.find_photographs_by_artist(diane_arbus)
    #=> [#<Photograph:0x00007fa3c13a4050...>, #<Photograph:0x00007fa3c110e4a8...>]
  end

  def test_it_can_find_artists_with_multiple_photos
    attributes_1 = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    }
    photo_1 = Photograph.new(attributes_1)
    attributes_2 = {
      id: "2",
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"
    }
    photo_2 = Photograph.new(attributes_2)
    attributes_3 = {
      id: "3",
      name: "Identical Twins, Roselle, New Jersey",
      artist_id: "3",
      year: "1967"
    }
    photo_3 = Photograph.new(attributes_3)
    attributes_4 = {
      id: "4",
      name: "Child with Toy Hand Grenade in Central Park",
      artist_id: "3",
      year: "1962"
    }
    photo_4 = Photograph.new(attributes_4)
    attributes_1 = {
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
    }
    artist_1 = Artist.new(attributes_1)
    attributes_2 = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }
    artist_2 = Artist.new(attributes_2)
    attributes_3 = {
      id: "3",
      name: "Diane Arbus",
      born: "1923",
      died: "1971",
      country: "United States"
    }
    artist_3 = Artist.new(attributes_3)
    curator = Curator.new
    #=> #<Curator:0x00007fa3c182da18...>
    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)
    curator.add_photograph(photo_3)
    curator.add_photograph(photo_4)
    curator.add_artist(artist_1)
    curator.add_artist(artist_2)
    curator.add_artist(artist_3)
    diane_arbus = curator.find_artist_by_id("3")

    assert_equal [diane_arbus], curator.artists_with_multiple_photographs
#=> [#<Artist:0x00007fa3c13eef88 @born="1923", @country="United States", @died="1971", @id="3", @name="Diane Arbus">]
    assert_equal 1, curator.artists_with_multiple_photographs.length
#=> 1
    assert diane_arbus == curator.artists_with_multiple_photographs.first
#=> true
  end

  def test_it_can_find_artists_from_US
    attributes_1 = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    }
    photo_1 = Photograph.new(attributes_1)
    attributes_2 = {
      id: "2",
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"
    }
    photo_2 = Photograph.new(attributes_2)
    attributes_3 = {
      id: "3",
      name: "Identical Twins, Roselle, New Jersey",
      artist_id: "3",
      year: "1967"
    }
    photo_3 = Photograph.new(attributes_3)
    attributes_4 = {
      id: "4",
      name: "Child with Toy Hand Grenade in Central Park",
      artist_id: "3",
      year: "1962"
    }
    photo_4 = Photograph.new(attributes_4)
    attributes_1 = {
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
    }
    artist_1 = Artist.new(attributes_1)
    attributes_2 = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }
    artist_2 = Artist.new(attributes_2)
    attributes_3 = {
      id: "3",
      name: "Diane Arbus",
      born: "1923",
      died: "1971",
      country: "United States"
    }
    artist_3 = Artist.new(attributes_3)
    curator = Curator.new
    #=> #<Curator:0x00007fa3c182da18...>
    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)
    curator.add_photograph(photo_3)
    curator.add_photograph(photo_4)
    curator.add_artist(artist_1)
    curator.add_artist(artist_2)
    curator.add_artist(artist_3)
    assert_equal [photo_2, photo_3], curator.photographs_taken_by_artist_from("United States")
    #=> [#<Photograph:0x00007fa3c286b088...>, #<Photograph:0x00007fa3c13a4050...>, #<Photograph:0x00007fa3c110e4a8...>]
  end

  def test_it_can_find_artists_from_US
    attributes_1 = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    }
    photo_1 = Photograph.new(attributes_1)
    attributes_2 = {
      id: "2",
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"
    }
    photo_2 = Photograph.new(attributes_2)
    attributes_3 = {
      id: "3",
      name: "Identical Twins, Roselle, New Jersey",
      artist_id: "3",
      year: "1967"
    }
    photo_3 = Photograph.new(attributes_3)
    attributes_4 = {
      id: "4",
      name: "Child with Toy Hand Grenade in Central Park",
      artist_id: "3",
      year: "1962"
    }
    photo_4 = Photograph.new(attributes_4)
    attributes_1 = {
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
    }
    artist_1 = Artist.new(attributes_1)
    attributes_2 = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }
    artist_2 = Artist.new(attributes_2)
    attributes_3 = {
      id: "3",
      name: "Diane Arbus",
      born: "1923",
      died: "1971",
      country: "United States"
    }
    artist_3 = Artist.new(attributes_3)
    curator = Curator.new
    #=> #<Curator:0x00007fa3c182da18...>
    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)
    curator.add_photograph(photo_3)
    curator.add_photograph(photo_4)
    curator.add_artist(artist_1)
    curator.add_artist(artist_2)
    curator.add_artist(artist_3)

    assert_equal [], curator.photographs_taken_by_artist_from("Argentina")
  end
end
