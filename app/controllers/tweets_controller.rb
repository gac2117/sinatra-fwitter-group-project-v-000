class TweetsController < ApplicationController
  get '/tweets' do
    @tweets = Tweet.all
    if logged_in?
      erb :'/tweets/tweets'
    else
      redirect to 'login'
    end
  end

  get '/tweets/new' do
    if logged_in?
      erb :'/tweets/new'
    end
  end

  post '/tweets/new' do
    if logged_in?
      if params[:content] == ""
        redirect to '/tweets/new'
      else
        @tweet = Tweet.create(content: params[:content])
        @current_user = User.find_by_id(session[:user_id])
        @tweet.user_id = @current_user.id
        @tweet.save
      end
    else
      redirect to '/login'
    end
  end

end
