# -*- encoding: UTF-8 -*-

require 'bootstrap'

MAIN_HEADER = [ 200, { 'Content-Type' => 'text/plain' }, [ 'Hello' ]]

#TODO: create a simple worker to clean folder
#cleaner = Fractal::Cleaner.new
#cleaner.async.execute

CelluloidFractal = lambda do |env|
  MAIN_HEADER and return unless Faye::WebSocket.websocket?(env)

  ws = Faye::WebSocket.new(env)

  ws.on :message do |event|
    type = event.data

    observer = Fractal::Observer.new
    observer.subscribe('fractal_created', :on_creation)

    producer = Fractal::Producer.new(socket: ws, fractal: type)
    producer.async.create
  end

  ws.on :close do |event|
    ws = nil
  end

  ws.rack_response
end

