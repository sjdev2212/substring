# frozen_string_literal: true

module Towable
  def can_tow(kilos)
    kilos > 2000
  end
end

class Vehicle
  @@number_of_vehicles = 0
  def initialize
    @@number_of_vehicles += 1
  end

  def self.number_of_vehicles
    puts "This program has created #{@@number_of_vehicles} vehicles"
  end

  def speed_up(s)
    @current_speed += s
  end

  def brake(s)
    @current_speed -= s
  end

  def shut_engine
    @current_speed = 0
    puts 'engine stopped'
  end

  def spray_paint(color)
    self.color = color
  end
end

class MyCar < Vehicle
  attr_accessor :color, :make
  attr_reader :year, :current_speed

  TIS_MINE = 'El branquicho constante'
  def initialize(y, c, m)
    @year = y
    @color = c
    @make = m
    @current_speed = 0
  end
end

class MyTruck < Vehicle
  NOT_MINE = 'lo vendi al blancote'
  include Towable
end
blanquicho = MyCar.new(2017, 'white', 'peugeot 208')

blanquicho.speed_up(84)
blanquicho.brake(4)
puts blanquicho.current_speed
blanquicho.color = 'grey'
puts blanquicho.color
puts blanquicho.year
puts blanquicho.make
blanquicho.spray_paint('green')
puts blanquicho.color
puts Vehicle.ancestors
blancote = MyTruck.new
puts blancote.can_tow(25)
puts MyTruck.ancestors
