# -*- encoding: UTF-8 -*-

module Fractal
  class Cleaner
    include Celluloid

    CLEAN_INTERVAL = 60
    CLEAN_CRITERIA = 300

    def execute
      timers = Timers.new
      timers.every(CLEAN_INTERVAL) do
        fractals_glob = File.join(get_fractals_path, '*.png')

        Dir.glob(fractals_glob).each do |file_path|
          File.unlink(file_path) if deletion_allowed?(file_path)
        end
      end

      loop { timers.wait }
    end

    private

    def get_fractals_path
      root_path = File.dirname(__FILE__), '..', '..'
      File.expand_path(File.join(root_path, 'public', 'assets', 'images', 'fractals'))
    end

    def deletion_allowed?(file_path)
      Time.now - File.ctime(file_path) > CLEAN_CRITERIA
    end
  end
end

