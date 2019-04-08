class UsersController < ApplicationController

  get '/signup' do
    erb :'/users/create_user'
  end

  post '/signup' do
    user = User.create(params[:user])
    if !params[:username]
      redirect to '/signup'
    else
      session[:user_id] = user.id
      redirect to '/tweets'
    end
  end

end
