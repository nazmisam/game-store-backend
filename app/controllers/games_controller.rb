class GamesController < ApplicationController
  before_action :set_game, only: [:show, :update, :destroy]
  before_action :authenticate_user! # Require authentication for all actions

  # GET /games
  def index
    @games = Game.all
    render json: @games
  end

  # GET /games/:id
  def show
    render json: @game
  end

  # POST /games
  def create
    @game = Game.new(game_params)

    if @game.save
      render json: @game, status: :created
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # PUT /games/:id
  def update
    if @game.update(game_params)
      render json: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # DELETE /games/:id
  def destroy
    @game.destroy
    head :no_content
  end

  private

  # Find a game by ID
  def set_game
    @game = Game.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Game not found' }, status: :not_found
  end

  # Strong parameters
  def game_params
    params.require(:game).permit(:title, :authors, :release_date, :description)
  end
end
