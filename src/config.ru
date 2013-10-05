# -*- encoding: UTF-8 -*-

root_path = File.dirname(__FILE__)
require File.join(root_path, 'lib', 'bootstrap')

map '/fractals' do
  run CelluloidFractal
end

use Rack::Static, urls: %w(/ /assets), root: 'public', index: 'index.html'
run Rack::Directory.new(File.join(root_path, 'public'))

