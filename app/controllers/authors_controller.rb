class AuthorsController < ApplicationController

  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end
  def create
    author = Author.create( author_params )
    redirect_to "/authors/#{ author.id }"
  end

  def edit
    @author = Author.find(params[:id])
  end

  # def profile
  # end


  private

  def author_params
    params.require(:author).permit(:name)
  end

end
