# -*- encoding: UTF-8 -*-

module Fractal
  class Observer
    include Celluloid, Celluloid::Notifications

    task_class TaskThread

    def on_creation(*args)
      data = args.last

      file_path = data[:file_path]
      socket = data[:socket]

      args = { file_path: File.basename(file_path) }

      socket.send(JSON.dump(args))
    rescue IOError
      # nothing to do
    end
  end
end

