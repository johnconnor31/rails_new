class CommentsController < ApplicationController
def create
  @game = Game.find(user_comment[:game_id])
  # @game.comments.create(user_comment)
  commt = Comment.create(user_comment)
  MainMailer.notify_game_creator(commt).deliver_later

    redirect_to @game
end
  def show
    Array @comments_array = Comment.find_by_q_id(params[:id])
    render 'games/show' 
  end  

private def user_comment
  params.require(:userComment).permit(:game_id,:email,:body)
end
end