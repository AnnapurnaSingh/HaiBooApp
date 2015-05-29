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

  def api
    id = params[:id]
    if (id)
      @poem = Poem.find(id)
    else
      @poem = Poem.all
    end
    render json: @poem
  end


  private

  def poem_params
    params.require(:poem).permit(:author_id, :line_01, :line_02, :line_03)
  end


end
