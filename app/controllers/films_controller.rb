class FilmsController < ApplicationController
  before_action :set_film, only: [:show, :update, :edit, :destroy]
  skip_before_action :verify_paid, only: :index
  after_action :more_cowbell
  skip_after_action :more_cowbell, only: [:new, :edit]

  def index
    @films = Film.all
  end

  def show
  end

  def new
    @film = Film.new
  end

  def edit
  end

  def create
    @film = Film.new(film_params)

    if @film.save
      redirect_to film_path(@film)
    else
      render :new
    end
  end

  def update
    if @film.update(film_params)
      redirect_to film_path(@film)
    else
      render :edit
    end
  end

  def destroy
    @film.destroy
    redirect_to films_path
  end

  private
    def film_params
      params.require(:film).permit(:name) 
    end

    def set_film
      @film = Film.find(params[:id])
    end

    def more_cowbell
      Rails.logger.info('DING DING DING')
    end

end



