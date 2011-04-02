require "rubygems"
require "sinatra/base"
require "em-websocket"
require "thin"

EventMachine.run do
  class Pong < Sinatra::Base
    get '/' do
      "hello, world!"
    end
  end
  
  EM::WebSocket.start(:host => '0.0.0.0', :port => 3001) do
    # websocket shit goes here
  end
  
  Pong.run! :port => 3000
end