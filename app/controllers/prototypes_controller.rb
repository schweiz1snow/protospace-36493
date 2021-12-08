class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @prototype = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def show
    @prototype = Prototype.new
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @manycomment = @prototype.comments
  end

  def edit
    @prototype = Prototype.find(params[:id])
    redirect_to root_path unless current_user == @prototype.user
  end

  def update
    @prototype = Prototype.find(params[:id])
    redirect_to root_path unless current_user == @prototype.user
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype.id)
    else
      render action: :edit
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

end
