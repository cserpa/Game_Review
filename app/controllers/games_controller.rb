class GamesController < ApplicationController
  before_action :find_game, only: [:show, :edit, :update, :destroy]

  def index
    @games = Game.all.order("created_at DESC")
  end

  def show
  end

  def new
    @game = current_user.games.build
    @platforms = Platform.all.map{ |p| [p.name, p.id] }
  end

  def create
    @game = current_user.games.build(game_params)
    @game.platform_id = params[:platform_id]

    if @game.save
      flash[:notice] = 'Game added successfully!'
      redirect_to root_path
    else
      flash[:notice] = @game.errors.full_messages.join(', ')
      render 'new'
    end
  end

  def edit
    @platforms = Platform.all.map{ |p| [p.name, p.id] }
  end

  def update
    @game.platform_id = params[:platform_id]
    if @game.update(game_params)
      flash[:notice] = 'Game updated successfully!'
      redirect_to game_path(@game)
    else
      flash[:notice] = @game.errors.full_messages.join(', ')
      render 'edit'
    end
  end

  def destroy
    flash[:notice] = 'Game deleted successfully'
    @game.destroy
    redirect_to root_path
  end

  private

    def game_params
      params.require(:game).permit(:title, :developer, :description, :platform_id)
    end

    def find_game
      @game = Game.find(params[:id])
    end

end
