# -*- encoding: UTF-8 -*-

$:.push(File.dirname(__FILE__))

require 'bundler/setup'
require 'puma'
require 'faye'
require 'faye/websocket'
require 'celluloid'
require 'celluloid/autostart'
require 'timers'
require 'fractals'
require 'json'

require 'fractal/cleaner'
require 'fractal/producer'
require 'fractal/factory'
require 'fractal/observer'
require 'fractal/types/base'
require 'fractal/types/burning_ship'
require 'fractal/types/feigenbaum'
require 'fractal/types/mandelbrot'
require 'fractal/types/seahorse_valley'
require 'fractal/types/snowflake'

require 'patches'
require 'application'

