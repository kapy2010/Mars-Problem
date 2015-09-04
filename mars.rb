class MarsRover
  def initialize(coordinates, max_coordinates)
    max_coordinates = max_coordinates.split(" ")
    coordinates = coordinates.split(" ")
    @max_x = max_coordinates[0].to_i
    @max_y = max_coordinates[1].to_i
    @x = coordinates[0].to_i
    @y = coordinates[1].to_i
    @head = coordinates[2]
  end

  def move(direction)
    fall_off = 0
    if direction == "R"
      case @head
      when "N"
        @head = "E"
      when "E"
        @head = "S"
      when "S"
        @head = "W"
      else "W"
        @head = "N"
      end
    elsif direction == "L"
      case @head
      when "N"
        @head = "W"
      when "W"
        @head = "S"
      when "S"
        @head = "E"
      else "E"
        @head = "N"
      end
    elsif direction == "M"
      case @head
      when "N"
        @y < @max_y ? @y += 1 : fall_off = 1
      when "S"
        @y > 0 ? @y -= 1 : fall_off = 1
      when "E"
        @x < @max_x ? @x += 1 : fall_off = 1
      else
        @x > 0 ? @x -= 1 : fall_off = 1
      end
    end

    if fall_off == 1
      return "fall"
    else
      return nil
    end

  end

  def navigate(directions)
    directions = directions.split("")
    directions.each { |direction| return "Rovers falled off!" if self.move(direction) == "fall" }
    return "#{@x} #{@y} #{@head}"
  end

end


# puts "Enter the number of rovers"
# number_of_rovers = gets.chomp.to_i
#
# while number_of_rovers > 0
#
#   puts "Enter the dimensions of plateau"
#   max_coordinates = gets.chomp
#
#   puts "Enter the position of rover"
#   coordinates = gets.chomp
#
#   puts "Enter the letters for navigation"
#   direction_input = gets.chomp
#
#   mars = MarsRover.new(coordinates, max_coordinates)
#
#   puts "Rovers position: #{mars.navigate(direction_input)}"
#
#   number_of_rovers -= 1
# end
