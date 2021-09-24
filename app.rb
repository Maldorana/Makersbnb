require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './database_connection_setup'
require 'pg'
require './lib/space'
require './lib/user'
require './lib/request'
require './lib/bookingdate'

class MakersBnB < Sinatra::Base

  set :public, 'public'
  enable :sessions, :method_override

  configure :development do
    register Sinatra::Reloader
  end

  register Sinatra::Flash

  get '/' do
    @user = User.find(id: session[:user_id])
    erb(:index)
  end

  get '/users/new' do 
    @user = User.find(id: session[:user_id])
    erb :"users/new"
  end 

  post '/users' do
    @user = User.find(id: session[:user_id])
    user = User.create(email: params[:email], username: params[:username], password: params[:password])
    session[:user_id] = user.id
    redirect '/'
  end

  get '/sessions/new' do
    @user = User.find(id: session[:user_id])
    erb :"sessions/new"
  end 

  post '/sessions' do
    @user = User.find(id: session[:user_id])
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
    @user = User.find(id: session[:user_id])
    @spaces = Space.list_all
    erb(:"spaces/index")
  end

  post '/spaces' do
    @user = User.find(id: session[:user_id])
    Space.add(name: params[:name], description: params[:description], price: params[:price], date_start: params[:date_start].gsub('-', ''), date_end: params[:date_end].gsub('-', ''), user_id: session[:user_id])
    @spaces = Space.list_all
    redirect '/spaces/index'
  end

  get '/spaces/new' do
    @user = User.find(id: session[:user_id])
    erb(:"spaces/new")
  end

  get '/spaces/:id/show' do
    @user = User.find(id: session[:user_id])
    @space = Space.find(id: params[:id])
    @host = User.find(id: @space.user_id)
    erb(:"spaces/show")
  end

  delete '/spaces/:id' do
    @user = User.find(id: session[:user_id])
    Space.delete(id: params[:id])
    redirect '/spaces/index'
  end

  post '/spaces/:id/booking' do
    @user = User.find(id: session[:user_id])
    Request.add(space_id: params[:id], user_id: session[:user_id], date_start: params[:date_start].gsub('-', ''), date_end: params[:date_end].gsub('-', ''))
    redirect '/spaces/index'
  end

  get '/users/requests' do
    @user = User.find(id: session[:user_id])
    @requests = Request.list_all
    erb(:"users/requests")
    end

  run! if app_file == $0
end
