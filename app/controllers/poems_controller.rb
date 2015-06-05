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
    redirect_to "/api/poems/#{ poem.id }"
  end

  def edit
    @poem = Poem.find(params[:id])
  end

  def profile
    # Allows access to the profile.html.erb
  end

  def api
    id = params[:id]
    if (id)
      @poem = Poem.find(id)
    else
      @poem = Poem.all
    end
    render json: @poem
  end

  def HaiBoo
    @HaiBoo = Poem.write
    render json: @HaiBoo
  end

  def text_boo
    phone_number = params[:phone_number]
    poem = params[:poem]
    nexmo = Nexmo::Client.new(key: ENV['key'], secret: ENV['secret'])
    nexmo.send_message(from: "12282063297", to: "#{phone_number}", text: "#{poem}")
  end

  private

  def poem_params
    params.require(:poem).permit(:author, :line_01, :line_02, :line_03)
  end


end
