class ArticlesController < ApplicationController
  def index
    @arti=Article.all
  end

  def show
    @arti=Article.find(params[:id]) #params[:id] szuka id obiektu i przekazuje do metody find
  end

  def new #metoda tylko dla formularzu
    @arti=Article.new #tworzy nowy pusty obiekt
  end

  def create #metoda do zatwierdzenia danych dlatego dziala tylko na przycisniecie przycisku zatwierdzenia nie ma wlasnego szablonu
    arti=Article.new(article_params)
    arti.save
    redirect_to arti
  end

  def destroy
    arti=Article.find(params[:id])
    arti.destroy
    redirect_to root_path

  end

  :private
  def article_params #umozliwia dostep do atrybutow stosowany do obrony danych przed innymi uzytkownikami
    params.require(:article).permit(:title,:body)
  end

end
