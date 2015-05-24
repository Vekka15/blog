class ArticlesController < ApplicationController
  def index
    @arti=Article.all
  end

  def show
    @arti=Article.find(params[:id]) #params[:id] szuka id obiektu i przekazuje do metody find
    @comm=Comment.all
  end

  def new #metoda tylko dla formularzu
    @arti=Article.new #tworzy nowy pusty obiekt
  end

  def create #metoda do zatwierdzenia danych dlatego dziala tylko na przycisniecie przycisku zatwierdzenia nie ma wlasnego szablonu
    arti=Article.new(article_params)
    arti.user_id=current_user.id
    arti.save
    redirect_to arti
  end

  def destroy
    arti=Article.find(params[:id])
    arti.destroy
    redirect_to root_path

  end

  def search
    @arti=Article.all
    @arti.each{|f|
      if f.title==params[:name]
        @arti1=f
      end
      }
  end

  def edit
    @arti=Article.find(params[:id])
  end

  def update
    arti=Article.find(params[:id])
    arti.update_attributes(article_params)
    redirect_to arti
  end

  :private
  def article_params #umozliwia dostep do atrybutow stosowany do obrony danych przed innymi uzytkownikami
    params.require(:article).permit(:title,:body)
  end

end
