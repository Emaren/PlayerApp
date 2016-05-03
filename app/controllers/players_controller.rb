class PlayersController < ApplicationController

  # New player
  def new
    @player = Player.new
  end

  # Create new player in the DB
  def create
    @player = Player.new player_params
    if @player.save
      redirect_to player_path(@player), notice: "Player Successfully created!"
    else
      flash[:alert] = "See error(s) below..."
      render :new
    end

  end

  # Index all Player
  def index
    @players = Play.all
  end

  # Display each player
  def show
    @player = Player.find params[:id]
  end

  # Update a player's info
  def update
    @player = Player.find params[:id]
    if @player.update player_params
      redirect_to player_path(@player), notice: "Player Successfully updated!"
    else
      flash[:alert] = "See error(s) below..."
      render :edit
    end
  end

  # Delete player record from the DB.
  def destroy
    @player = player.find params[:id]
    @player.destory
    redirect_to players_path
  end

  private

  def player_params
    params.require(:player).permit(:name, :age, :team)
  end
end
