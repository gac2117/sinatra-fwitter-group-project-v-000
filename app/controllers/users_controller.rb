class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect to '/tweets'
    else
      erb :'/users/create_user'
    end
  end

  post '/signup' do
    user = User.create(params[:user])
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    else
      session[:user_id] = user.id
      redirect to '/tweets'
    end
  end

  get '/login' do
    erb :'/users/login'
  end

end
