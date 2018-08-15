class FilmsController < ApplicationController
  before_action :set_film, only: [:show, :update, :edit, :destroy]
  before_action :set_actor

    def index
      @films = Film.all
    end

    def show
    end

    def new
  @film = Film.new
  render partial: "form"
end

def edit
  render partial: "form"
end

    def create
      @film = Film.new(film_params)

      if @film.save
        redirect_to films_path
      else
        render :new
      end
    end

    def update
      if @film.update(film_params)
        redirect_to @film
      else
        render :edit
      end
    end

    def destroy
      @film.destroy
      redirect_to films_path
    end

    private

      def set_film
        @film = Film.find(params[:id])
      end

      def film_params
        params.require(:film).permit(:name)
      end
  end
