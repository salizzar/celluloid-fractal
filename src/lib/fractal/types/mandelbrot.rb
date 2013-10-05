# -*- encoding: UTF-8 -*-

require 'fractals'
require 'RMagick'

module Fractal
  module Types
    class Mandelbrot < Base
      def render
        fractal = Fractals::Mandelbrot.new(@complex)
        fractal.width = @width
        fractal.height = @height
        fractal.magnification = 5
        fractal.renderer = Fractals::Renderers::RMagickRenderer
        fractal.algorithm = Fractals::Algorithms::NormalizedIterationCount
        fractal.theme = Fractals::Themes::Water
        fractal.write(@file_path)
      end
    end
  end
end

