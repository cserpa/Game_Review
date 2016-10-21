class GamesController < ApplicationController

  def index
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      flash[:notice] = 'Game added successfully!'
      redirect_to root_path
    else
      flash[:notice] = @game.errors.full_messages.join(', ')
      render 'new'

    end
  end

  private

    def game_params
      params.require(:game).permit(:title, :developer, :description)
    end

end
