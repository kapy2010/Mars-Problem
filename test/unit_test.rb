require "../rovers.rb"
require "test/unit"

class TestPlateau < Test::Unit::TestCase
  def test_to_pass
    plateau = Plateau.new(5, 5)

    #test class initialization
    assert_equal(5, plateau.instance_variable_get("@plat_x"))
    assert_equal(5, plateau.instance_variable_get("@plat_y"))
  end
end

class TestRover < Test::Unit::TestCase
  def test_to_pass
    plateau = Plateau.new(5, 5)
    rover = Rover.new(plateau, 1, 2, "N")

    #test class initialization
    assert_equal(5, rover.instance_variable_get("@plat_x"))
    assert_equal(5, rover.instance_variable_get("@plat_y"))
    assert_equal(1, rover.instance_variable_get("@x"))
    assert_equal(2, rover.instance_variable_get("@y"))
    assert_equal("N", rover.instance_variable_get("@head"))
  end
end

class TestNavigate < Test::Unit::TestCase
  def test_to_pass
    plateau = Plateau.new(5, 5)
    rover = Rover.new(plateau, 1, 4, "N")
    navigate = Navigate.new(rover)

    #test class initialization
    assert_instance_of(Rover, navigate.instance_variable_get("@rover"))

    # test moveLeft method
    assert_equal("W", navigate.moveLeft)

    # test moveRight method
    assert_equal("N", navigate.moveRight)

    # test moveForward method
    assert_equal(nil, navigate.moveForward)
    assert_equal("1 5 N", navigate.display_rover)

    # test moveForward fall case
    assert_equal("fall", navigate.moveForward)

    # test move method
    assert_equal("0 5 W", navigate.move("LM"))
    assert_equal("Mars Rover falled off!", navigate.move("M"))

    # test display_rover method
    assert_equal("0 5 W", navigate.display_rover)
  end
end
