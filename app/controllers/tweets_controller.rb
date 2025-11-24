class TweetsController < ApplicationController
  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweet_params)
    @tweet.shortened = RubyLLM.chat.ask("Generate a tweet from this text: #{@tweet.long}").content

    if @tweet.save
      redirect_to tweet_path(@tweet), notice: "Tweet eas successfully created"
    else
      render :new, status: :unprocesable_entity
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  private

  def tweet_params
    params.require(:tweet).permit(:long)
  end
end
