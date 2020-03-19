class StarSystem
  attr_reader :name, :planets

     def initialize(name, planets)
         @name = name
         @planets = planets
     end

     def planet_names()
         return @planets.map{|planet| planet.name}
     end

     def total_planets()
         return @planets.length
     end

     def get_planet_by_name(planet_name)
         return @planets.find{|planet| planet.name == planet_name }
     end

     def get_largest_planet
        #  largest_value = 0
        #  @planets.each do |planet|
        #      if planet.diameter >= largest_value
        #          largest_value = planet.diameter
        #      end
        #  end
        # return @planets.find{|planet| planet.diameter == largest_value}
        return @planets.max_by(&:diameter)
     end

     def get_smallest_planet
         # smallest_value = 9999999999999
         # @planets.each do |planet|
         #     if planet.diameter <= smallest_value
         #         smallest_value = planet.diameter
         #     end
         # end
         # return @planets.find{|planet| planet.diameter == smallest_value}
         return @planets.min_by(&:diameter)
     end

     def get_planets_with_no_moons
         return @planets.keep_if{|planet| planet.number_of_moons == 0}
     end

     def get_planets_with_more_moons(num_of_moons)
         found_planets = @planets.keep_if{|planet| planet.number_of_moons > 4}
         return found_planets.map{|planet| planet.name}
     end

     def get_number_of_planets_closer_than(under_distance_value)
         found_planets = @planets.keep_if{|planet| planet.distance_from_sun < under_distance_value}
         return found_planets.length
    end

    def get_total_number_of_moons
        return @planets.reduce(0){|sum, planet| sum + planet.number_of_moons }
    end

    def get_planet_names_sorted_by_increasing_distance_from_sun
        sorted_planets = @planets.sort_by(&:distance_from_sun)
        return sorted_planets.map(&:name)
    end

    def get_planet_names_sorted_by_size_decreasing
        sorted_planets = @planets.sort_by(&:diameter).reverse
        return sorted_planets.map(&:name)
    end

end
