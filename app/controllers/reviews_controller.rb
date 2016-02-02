class ReviewsController < ApplicationController

  def all
    @user = User.find(params[:id])
    @reviews = @user.reviews
    render :'reviews/index'
  end

  def new
    @user = User.find(params[:user_id])
    if @user != current_user
      @review = Review.new
      render :'reviews/new'
    end
  end

  def create
    @user = User.find(params[:user_id])
    if current_user != @user
      @new_review =  current_user.written_reviews.new(review_params)
      @new_review.receiver_id = params[:user_id]
      if @new_review.save
        redirect_to user_path(@new_review.receiver)
      else
       @errors = @new_review.errors.full_messages
       render :'reviews/new'
      end  
    else
      render text: "Go away",status:422
    end  
  end

  private

  def review_params
    params.require(:review).permit(:content,:receiver_id)
  end
end
