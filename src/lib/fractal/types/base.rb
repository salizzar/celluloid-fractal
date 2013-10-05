# -*- encoding: UTF-8 -*-

require 'fractals'

module Fractal
  module Types
    class Base
      def initialize(width, height, complex, file_path)
        @width, @height, @complex, @file_path = width, height, complex, file_path
      end
    end
  end
end
