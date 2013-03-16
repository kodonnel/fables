class LinksController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user,   only: :destroy
  before_filter :load_linkable

	def create
    #@link = linkable.links.build(params[:link])
    @link = @linkable.links.new(params[:link])
    if @link.save
      redirect_to @linkable, notice: "Link created!"
    else
      render users_path(current_user)
    end
  end

  def new
    @link = @linkable.links.new
  end

  def show
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find_by_id(params[:id])
    if @link.update_attributes(params[:link])
      flash[:success] = "Link updated"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def destroy
    @link.destroy
    redirect_to root_url
  end

    private

    def correct_user
      @link = current_user.links.find_by_id(params[:id])
      redirect_to root_url if @link.nil?
    end

    def load_linkable
      resource, id = request.path.split('/')[1, 2]
      @linkable = resource.singularize.classify.constantize.find(id)
    end

end
