class UsersController < ApplicationController

  get '/signup' do
    erb :'/users/create_user'
  end

  post '/signup' do
    user = User.create(params[:user])
    if user
      session[:user_id] = user.id
      redirect to '/twitter'
    else
      redirect to '/signup'
    end
  end

end
