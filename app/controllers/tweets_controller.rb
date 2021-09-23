class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  def new
    @tweet = Tweet.new
  end
  def create
    message = params[:tweet][:message]
    tdate = DateTime.now
    @tweet = Tweet.new(message: message, tdate: tdate)
    if @tweet.save
      flash[:notice] = '投稿しました'
      redirect_to '/'
    else
      render 'new'
    end
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
    tdate = DateTime.now
    @tweet = Tweet.find(params[:id])
    @tweet.update(message: message, tdate: tdate)
    if tweet.save
      flash[:notice] = '投稿を編集しました'
      redirect_to '/'
    else
      render 'edit'
    end
  end
end
