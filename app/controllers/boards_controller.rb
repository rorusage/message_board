class BoardsController < ApplicationController
before_action :authenticate_user!, except: [:index]
before_action :find_board, only: [:show, :edit, :update, :destroy]

  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)

    if @board.save
      redirect_to boards_path
    else
      render :new
    end
  end

  def show
    #@board = Board.find(params[:id])
  end

  def edit
    #@board = Board.find(params[:id])
  end

  def update
    #@board = Board.find(params[:id])

    if @board.update(board_params)
      redirect_to boards_path, notice: "留言更新成功！"
    else
      render :edit
    end
  end

  def destroy
    #@board = Board.find(params[:id])
    @board.destroy
    redirect_to boards_path, alert: "已刪除留言！"
  end

  private

  def find_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:title, :description)
  end
end
