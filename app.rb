require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'
require './lib/space.rb'

class MakersBnB < Sinatra::Base

  set :public, 'public'
  enable :sessions, :method_override

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

  post '/spaces' do
    Space.add(name: params[:name], description: params[:description], price: params[:price])
    @spaces = Space.list_all
    redirect '/spaces/index'
  end

  get '/spaces/new' do
    erb(:"spaces/new")
  end

  get '/spaces/:id/show' do
    @space = Space.find(id: params[:id])
    erb(:"spaces/show")
  end

  delete '/spaces/:id' do
    Space.delete(id: params[:id])
    redirect '/spaces/index'
  end

  run! if app_file == $0
end