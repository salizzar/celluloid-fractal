# -*- encoding: UTF-8

require 'complex'

module Fractal
  class Factory
    WIDTH   = 300
    HEIGHT  = 300

    def initialize(args)
      @fractal    = args[:fractal]
      @file_path  = args[:file_path]
    end

    def create
      complex = Complex(*random_floats)

      type = @fractal.to_s
      klass_name = type.split('_').collect(&:capitalize).join
      klass_ns = Kernel.const_get('Fractal').const_get('Types')

      klass = klass_ns.const_get(klass_name)
      instance = klass.new(WIDTH, HEIGHT, complex, @file_path)
      instance.render
    end

    private

    def random_floats
      modulo = 1.01
      factor = srand() % 2 == 0 ? 1 : -1
      [ srand().modulo(modulo) * factor, srand().modulo(modulo) * -1 ]
    end
  end
end

