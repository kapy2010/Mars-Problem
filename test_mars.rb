require_relative "mars.rb"
require "test/unit"

class TestMarsRover < Test::Unit::TestCase

  def test
    assert_equal("1 3 N", MarsRover.new(("1 2 N"), ("5 5")).navigate("LMLMLMLMM"))
    assert_equal("5 1 E", MarsRover.new(("3 3 E"), ("5 5")).navigate("MMRMMRMRRM"))
    assert_equal("Rovers falled off!", MarsRover.new(("0 0 W"), ("5 5")).navigate("M"))
    assert_equal("Rovers falled off!", MarsRover.new(("0 0 S"), ("5 5")).navigate("M"))
    assert_equal("Rovers falled off!", MarsRover.new(("5 5 N"), ("5 5")).navigate("M"))
    assert_equal("Rovers falled off!", MarsRover.new(("5 5 E"), ("5 5")).navigate("M"))
    assert_equal("Rovers falled off!", MarsRover.new(("0 5 N"), ("5 5")).navigate("M"))
    assert_equal("Rovers falled off!", MarsRover.new(("0 5 W"), ("5 5")).navigate("M"))
    assert_equal("Rovers falled off!", MarsRover.new(("5 0 S"), ("5 5")).navigate("M"))
    assert_equal("Rovers falled off!", MarsRover.new(("5 0 E"), ("5 5")).navigate("M"))
  end

end
