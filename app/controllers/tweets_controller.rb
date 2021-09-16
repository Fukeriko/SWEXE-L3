class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  def new
    @tweet = Tweet.new
  end
  def create
    message = params[:tweet][:message]
    tdate = params[:tweet][:tdate]
    tweet = Tweet.new(message: message, tdate: tdate)
    tweet.save
    redirect_to '/'
  end
  def show
    @tweet = Tweet.find(params[:id])
  end
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to '/'
  end
  def edit
    @tweet =Tweet.find(params[:id])
  end
  def update
    message = params[:tweet][:message]
    tdate = params[:tweet][:tdate]
    tweet = Tweet.find(params[:id])
    tweet.update(message: message, tdate: tdate)
    tweet.save
    redirect_to '/'
  end
end
