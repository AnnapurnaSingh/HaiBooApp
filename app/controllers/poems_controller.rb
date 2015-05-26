class PoemsController < ApplicationController
  def index
    @poems = Poem.all
  end

  def show
    @poem = Poem.find(params[:id])
  end

  def new
    @poem = Poem.new
  end
  def create
    poem = Poem.create( poem_params )
    redirect_to "/poems/#{ poem.id }"
  end

  def edit
    @poem = Poem.find(params[:id])
  end

  # def profile
  # end

  # def update
  # end


  private

  def poem_params
    params.require(:poem).permit(:poem_id, :author, :text)
  end


end
