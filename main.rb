require 'sinatra/base'
Dir['./lib/*.rb'].each { |f| require f }

class Main < Sinatra::Base
  get '/' do
    erb :index #, locals: { address: address }
  end

  get '/geocodes' do
    erb :geocodes
  end
end
