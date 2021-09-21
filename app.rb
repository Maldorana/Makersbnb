require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'
require './lib/space.rb'

class MakersBnB < Sinatra::Base

  set :public, 'public'
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb(:index)
  end

  get '/spaces/index' do
    @spaces = Space.list_all
    erb(:"spaces/index")
  end

  post '/spaces/index' do
    Space.add(name: params[:name], description: params[:description], price: params[:price],)
    @spaces = Space.list_all
    erb(:"spaces/index")
  end

  get '/spaces/new' do
    erb(:"spaces/new")
  end

  run! if app_file == $0
end