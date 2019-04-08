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
      @tweet = Tweet.new(content: params[:content])
    end
  end

end
