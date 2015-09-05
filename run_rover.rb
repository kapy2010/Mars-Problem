require_relative "rovers.rb"

puts "Enter the number of rovers"
number_of_rovers = gets.chomp.to_i

while number_of_rovers > 0
  puts "Enter the dimensions of plateau"
  plat_coordinates = gets.chomp.split(" ")
  # plat_coordinates = plat_coordinates.split(" ")
  plateau = Plateau.new(plat_coordinates[0].to_i, plat_coordinates[1].to_i)

  puts "Enter the position of rover"
  coordinates = gets.chomp.split(" ")
  rover = Rover.new(plateau, coordinates[0].to_i, coordinates[1].to_i, coordinates[2])

  puts "Enter the letters for navigation"
  directions = gets.chomp
  navigate = Navigate.new(rover)
  puts navigate.move(directions)

  number_of_rovers -= 1
end
