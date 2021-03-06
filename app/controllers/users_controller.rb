class UsersController < ApplicationController
  
  before_filter :signed_in_user,      only: [:index, :edit, :update, :destroy, :following, :followers]
  before_filter :correct_user,        only: [:edit, :update]
  before_filter :user_account_active, only: [:index]
  before_filter :admin_user,     only: :destroy

  def show
    @user = User.find(params[:id])
    @fables = @user.fables.paginate(page: params[:page])
    @links = @user.links.paginate(page: params[:page])
  end

	def new
    @user = User.new
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "User created."
      
      if @user.send_account_activation
        flash[:success] = "Confirmation email has been sent."
      end
      #sign_in @user
      #flash[:success] = "Welcome to the Fables!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

    def user_account_active
      redirect_to(root_path) unless current_user.account_active?
    end
end
