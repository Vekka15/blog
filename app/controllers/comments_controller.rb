class CommentsController < ApplicationController
  def new
    @arti=Article.find(params[:article_id])
    @comm = Comment.new
  end

  def create
    comm = Comment.new(comment_params)
    comm.article_id=params[:article_id]
    comm.save
    @arti=Article.find(params[:article_id])
    redirect_to article_path(comm.article)
  end

    :private
  def comment_params #umozliwia dostep do atrybutow stosowany do obrony danych przed innymi uzytkownikami
    params.require(:comment).permit(:body)
  end
end
