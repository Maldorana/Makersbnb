require 'sinatra/base'
require 'sinatra/reloader'
require './database_connection_setup'
require './lib/user'

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

  get '/sessions/new' do
    erb :"sessions/new"
  end


# post '/sessions' do
#   result = DatabaseConnection.query(
#     "SELECT * FROM users WHERE email = $1",
#     [params[:email]]
#   )
#   user = User.new(result[0]['id'], result[0]['email'], result[0]['password'])

#   session[:user_id] = user.id
#   # redirect('/bookmarks')
# end

post '/sessions' do
  user = User.authenticate(email: params[:email], password: params[:password])
  if user
    session[:user_id] = user.id
    redirect('/')
  else
    flash[:notice] = 'Please check your email or password.'
    redirect('/sessions/new')
  end
end

  run! if app_file == $0
end