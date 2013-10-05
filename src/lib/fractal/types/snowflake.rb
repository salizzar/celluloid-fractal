# -*- encoding: UTF-8 -*-

module Fractal
  module Types
    class Snowflake < Base
      def render
        fractal = Fractals::Julia.new(@complex)
        fractal.bailout = 5
        fractal.magnification = 25
        fractal.max_iterations = 100
        fractal.algorithm = Fractals::Algorithms::NormalizedIterationCount
        fractal.theme = Fractals::Themes::Winter
        fractal.set_color = [ 255, 255, 255 ]
        fractal.width = @width
        fractal.height = @height
        fractal.write(@file_path)
      end
    end
  end
end

