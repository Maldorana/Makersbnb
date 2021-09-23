require 'sinatra/base'
require 'sinatra/reloader'
require './database_connection_setup'
require './lib/user'
require 'sinatra/flash'
require 'pg'
require './lib/space.rb'

class MakersBnB < Sinatra::Base

  set :public, 'public'
  enable :sessions, :method_override

  configure :development do
    register Sinatra::Reloader
  end

  register Sinatra::Flash

  get '/' do
    @user = User.find(session[:user_id])
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

  post '/sessions' do
    user = User.authenticate(email: params[:email], username: params[:username], password: params[:password])
    if user
      session[:user_id] = user.id
      flash[:notice] = "You've logged in."
      redirect('/')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear 
    flash[:notice] = 'You have signed out.'
    redirect('/')
  end 

  get '/loggedout' do 
    flash[:notice] = 'You have signed out.'
  end 

  get '/spaces/index' do
    @spaces = Space.list_all
    erb(:"spaces/index")
  end

  post '/spaces' do
    Space.add(name: params[:name], description: params[:description], price: params[:price], user_id: session[:user_id])
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

  post '/spaces/:id/booking' do
    #Request.add(space_id:, user_id:, date:)
    connection = PG.connect(dbname: 'makersbnb')
    connection.exec("INSERT INTO requests_test (space_id, user_id, date) VALUES(#{params[:id]}, #{3}, #{'2021-09-30'}) RETURNING id, space_id, user_id, date;")
    redirect '/spaces/index'
  end

  run! if app_file == $0
end
