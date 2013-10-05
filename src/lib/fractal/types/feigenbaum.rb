# -*- encoding: UTF-8 -*-

module Fractal
  module Types
    class Feigenbaum < Base
      def render
        fractal = Fractals::Mandelbrot.new(@complex)
        fractal.width = @width
        fractal.height = @height
        fractal.max_iterations = 10
        fractal.magnification = 5
        fractal.renderer = Fractals::Renderers::RMagickRenderer
        fractal.algorithm = Fractals::Algorithms::NormalizedIterationCount
        fractal.theme = Fractals::Themes::Water
        fractal.write(@file_path)
      end
    end
  end
end

