# -*- encoding: UTF-8 -*-

module Fractal
  module Types
    class SeahorseValley < Base
      def render
        fractal = Fractals::Mandelbrot.new(@complex)
        fractal.width = @width
        fractal.height = @height
        fractal.magnification = 10
        fractal.algorithm = Fractals::Algorithms::NormalizedIterationCount
        fractal.theme = Fractals::Themes::Water
        fractal.write(@file_path)
      end
    end
  end
end

