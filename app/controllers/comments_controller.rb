class CommentsController < ApplicationController
  before_action :set_actor

  def new
    @comment = @actor.comments.new
  end

  def create
    @comment = @actor.comments.new(comment_params)

    if @comment.save
      redirect_to film_actor_path(@actor.film_id, @actor)
    else
      render :new
    end
  end

  private
    def set_actor
      @actor = Actor.find(params[:actor_id])
    end

    def comment_params
      params.require(:comment).permit(:author, :body)
    end
end
