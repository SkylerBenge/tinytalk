class HomeController < ApplicationController
  helper :headshot
  def signin
    if user_signed_in?
    redirect_to :index
    end
  end


  def index
    @user = current_user
    gon.current_user = @user.email
    @board = Board.new
    @boards = @user.boards.sort!{|a, b| b.created_at <=> a.created_at}
  end


  def action
  end

#this updates the profile pic
  def update
    @user = current_user
    @user.update_attributes(params[:user])
    redirect_to :index
  end

  def headshot_post_save(file_path)
    @headshot_photo = HeadshotPhoto.new
    @headshot_photo.avatar = File.new(file_path)
    @headshot_photo.save
  end

end
