module Geocode
  class Calculator

    WHITE_HOUSE_LONGITUDE = -77.035117
    WHITE_HOUSE_LATITUDE = 38.898761
    WHITE_HOUSE_COORDINATES = [WHITE_HOUSE_LATITUDE, WHITE_HOUSE_LONGITUDE]

    def initialize(coord)
      @coord = coord
    end

    def get_addresses(sort = false)
      results = {}

      @coord.each do |c|
        address = Geocoder.search(c).first.address
        distance = Geocoder::Calculations.distance_between(WHITE_HOUSE_COORDINATES, c)
        results[address] = distance
      end

      return results if !sort

      results.sort {|a, b| a[1] <=> b[1]}
    end
  end
end