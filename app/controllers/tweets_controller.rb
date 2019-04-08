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
    else
      redirect to '/login'
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
    end
  end

  get '/tweets/:id' do
    if logged_in?
      @tweet = Tweet.find_by_id(params[:id])
      erb :'tweets/show_tweet'
    else
      redirect to '/login'
    end
  end

  get '/tweets/:id/edit' do
    if logged_in?
      @tweet = Tweet.find_by_id(params[:id])
      erb :'/tweets/edit_tweet'
    end

  end

  patch '/tweets/:id' do
    if params[:content] == ""
      redirect to '/tweets/:id/edit'
    else
      @tweet = Tweet.find_by_id(params[:id])
      @tweet.content = params[:content]
      @tweet.save
    end
  end

end
