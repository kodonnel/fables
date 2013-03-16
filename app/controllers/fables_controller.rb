class FablesController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user,   only: :destroy

  def index
    @fables = Fable.search(params)  
  end

	def create
    @fable = current_user.fables.build(params[:fable])
    if @fable.save
      flash[:success] = "Fable created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def show
    @fable = Fable.find(params[:id])
    @links = @fable.links.paginate(page: params[:page])
  end

  def update
    @fable = Fable.find_by_id(params[:id])
    if @fable.update_attributes(params[:fable])
      flash[:success] = "Fable updated"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def edit
    @fable = Fable.find(params[:id])
  end

  def destroy
    @fable.destroy
    redirect_to root_url
  end

  private

    def correct_user
      @fable = current_user.fables.find_by_id(params[:id])
      redirect_to root_url if @fable.nil?
    end
end
