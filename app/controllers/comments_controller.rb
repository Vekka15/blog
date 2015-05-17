class CommentsController < ApplicationController
  def new
    @comm = Comment.new
  end

  def create
    comm = Comment.new(comment_params)
    comm.article_id=params[article_id]
    comm.save
    redirect_to comm
  end

    :private
  def comment_params #umozliwia dostep do atrybutow stosowany do obrony danych przed innymi uzytkownikami
    params.require(:comment).permit(:body,:article_id)
  end
end
