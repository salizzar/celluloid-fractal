# -*- encoding: UTF-8

require 'digest/md5'

module Fractal
  class Producer
    include Celluloid, Celluloid::Notifications

    task_class TaskThread

    def initialize(args)
      @fractal  = args[:fractal]
      @socket   = args[:socket]
    end

    def create
      file_path = create_file_path.to_s
      factory = Factory.new(fractal: @fractal, file_path: file_path)
      factory.create

      data = { socket: @socket, file_path: file_path }
      publish('fractal_created', data)

      terminate
    end

    private

    def create_file_path
      md5 = Digest::MD5.hexdigest(Time.now.to_s)
      root_path = File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'public'))
      File.join(root_path, 'assets', 'images', 'fractals', "#{md5}.png")
    end
  end
end

