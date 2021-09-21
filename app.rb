require 'sinatra/base'
require 'sinatra/reloader'

class MakersBnB < Sinatra::Base

  set :public, 'public'
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @user = User.find(session[:user_id])
   # @spaces = Spaces.all
    erb(:index)
  end

  get '/users/new' do 
    erb :"users/new"
  end 

  post '/users' do 
    user = User.create(email: params[:email], username: params[:username], password: params[:password])
    session[:user_id] = user.id
    redirect '/'
  end

  run! if app_file == $0
end