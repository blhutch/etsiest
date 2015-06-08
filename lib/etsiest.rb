require "etsiest/version"
require "sinatra/base"
require 'pry'

require 'etsy'
Etsy.api_key = 'cwo6c9n9159hsakqvz36lt8m'


module Etsiest
  
  class App < Sinatra::Base

  # start the server on the command line
  # in your browser: localhost:4567/search?q=

    get '/etsy_search' do
    # get the search parameter out
    # etsy_search = make a request to Etsy API with the gem
      @results = Etsy::Request.get('/listings/active', :includes =>
             ['Images', 'Shop'], :keywords => params['q'])
      erb :index
    end

    run! if app_file == $0
  end
end
