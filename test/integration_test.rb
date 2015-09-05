require "../rovers.rb"
require "test/unit"

class MarsRoverTest < Test::Unit::TestCase
  def test_to_pass
    assert_equal("1 3 N", Navigate.new(Rover.new(Plateau.new(5, 5), 1, 2, "N")).move("LMLMLMLMM"))
    assert_equal("5 1 E", Navigate.new(Rover.new(Plateau.new(5, 5), 3, 3, "E")).move("MMRMMRMRRM"))
    assert_equal("Mars Rover falled off!", Navigate.new(Rover.new(Plateau.new(5, 5), 0, 0, "W")).move("M"))
    assert_equal("Mars Rover falled off!", Navigate.new(Rover.new(Plateau.new(5, 5), 0, 0, "S")).move("M"))
    assert_equal("Mars Rover falled off!", Navigate.new(Rover.new(Plateau.new(5, 5), 5, 5, "N")).move("M"))
    assert_equal("Mars Rover falled off!", Navigate.new(Rover.new(Plateau.new(5, 5), 5, 5, "E")).move("M"))
    assert_equal("Mars Rover falled off!", Navigate.new(Rover.new(Plateau.new(5, 5), 0, 5, "N")).move("M"))
    assert_equal("Mars Rover falled off!", Navigate.new(Rover.new(Plateau.new(5, 5), 0, 5, "W")).move("M"))
    assert_equal("Mars Rover falled off!", Navigate.new(Rover.new(Plateau.new(5, 5), 5, 0, "S")).move("M"))
    assert_equal("Mars Rover falled off!", Navigate.new(Rover.new(Plateau.new(5, 5), 5, 0, "E")).move("M"))
  end
end
