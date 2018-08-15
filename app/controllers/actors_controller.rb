class ActorsController < ApplicationController
  before_action :set_film
  before_action :set_actor, only: [:show, :edit, :update, :destroy ]

  def index
    @actors = @film.actors
  end

  def show
  end

  def new
    @actor = @film.actors.new
  end

  def edit
  end

  def create
    @actor = @film.actors.new(actor_params)

    if @actor.save
      redirect_to film_actor_path(@film, @actor)
      #redirect_to [@film, @actor]
    else
      render :new
    end
  end

  def update
    if @actor.update(actor_params)
      redirect_to film_actor_path(@film, @actor)
      #redirect_to [@film, @actor]
    else
      render :edit
    end
  end

  def destroy
    @actor.destroy
    redirect_to film_actors_path
  end

  private

    def set_film
      @film = Film.find(params[:film_id])
    end

    def set_actor
      @actor = Actor.find(params[:id])
    end

    def actor_params
      params.require(:actor).permit(:name, :body)
    end








end
