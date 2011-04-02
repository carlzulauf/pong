require "rubygems"
require "sinatra/base"
require "em-websocket"

EventMachine.run do
  class Pong < Sinatra::Base
    get '/' do
      erb :index
    end
  end
  
  EM::WebSocket.start(:host => '0.0.0.0', :port => 3001) do |ws|
    
    timer = EventMachine::PeriodicTimer.new(1) do
      ws.send "The time is #{Time.now}"
    end
    
  end
  
  Pong.run! :port => 3000
end