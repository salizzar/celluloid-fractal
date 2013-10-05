# -*- encoding: UTF-8 -*-

module Fractal
  module Types
    class BurningShip < Base
      def render
        fractal = Fractals::BurningShip.new(@complex)
        fractal.magnification = 32
        fractal.width = @width
        fractal.height = @height
        fractal.write(@file_path)
      end
    end
  end
end

