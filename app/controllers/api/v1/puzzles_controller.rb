class Api::V1::Puzzles_Controller < ApplicationController
  before_action :current_user

  def create
    newPuzzle = Puzzle.new(puzzle_params)
    @user.puzzles << newPuzzle

    render json: @user.puzzles.last
  end

  def show
    render json: @user.puzzles
  end

  private

  def puzzle_params
    params.require(:puzzle).permit(:state,:col,:row,:img,:width,:height)
  end
end