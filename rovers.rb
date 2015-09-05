class Plateau
  attr_reader :plat_x, :plat_y
  def initialize(plat_x, plat_y)
    @plat_x = plat_x
    @plat_y = plat_y
  end
end

class Rover
  attr_reader :x, :y, :head, :plat_x, :plat_y
  def initialize(plateau, x, y, head)
    @x = x
    @y = y
    @head = head
    @plat_x = plateau.plat_x
    @plat_y = plateau.plat_y
  end
end

class Navigate
  def initialize(rover)
    @rover = rover
    @x = @rover.x
    @y = @rover.y
    @head = @rover.head
    @plat_x = @rover.plat_x
    @plat_y = @rover.plat_y
  end

  def move(directions)
    directions = directions.split("")
    directions.each do |direction|
      if direction == "R"
        self.moveRight
      elsif direction == "L"
        self.moveLeft
      elsif direction == "M"
        return "Mars Rover falled off!" if self.moveForward == "fall"
      end
    end
    return self.display_rover
  end

  def moveLeft
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
  end

  def moveRight
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
  end

  def moveForward
    fall_off = 0
    case @head
    when "N"
      @y < @plat_y ? @y += 1 : fall_off = 1
    when "S"
      @y > 0 ? @y -= 1 : fall_off = 1
    when "E"
      @x < @plat_x ? @x += 1 : fall_off = 1
    else
      @x > 0 ? @x -= 1 : fall_off = 1
    end
    return fall_off == 1 ? "fall" : nil
  end

  def display_rover
    return "#{@x} #{@y} #{@head}"
  end
end
