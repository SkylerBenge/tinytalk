class BoardsController < ApplicationController

  def index
    # @posts = Post.all
    # @post = Post.new
  end

  def new
    @board = Board.new
  end

  def create
    @user = current_user
    @added_user = User.find_by_email(params[:board][:users])
    if @added_user
      @board = @user.boards.create(:title => params[:board][:title])
      @board.users << @added_user
    end
    render :json => @board, status: 201
  end

   def show #/boards/:id
    @board = Board.find(params[:id])
    @pins = @board.pins.order("created_at DESC")
  end

  def destroy
    Board.delete(params[:id])
    render text: "removed board" , status: 200
  end

end
