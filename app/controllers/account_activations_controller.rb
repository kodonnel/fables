class AccountActivationsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    user.send_account_activation if user
    redirect_to root_url, :notice => "Email sent with account activation instructions."
  end

  def edit 
  	@user = User.find_by_account_activation_token!(params[:id])
  end

  def update
  	@user = User.find_by_account_activation_token!(params[:id])

    if @user.account_activation_sent_at < 2.hours.ago
      redirect_to new_account_activation_path, :alert => "Account activation has expired."
    elsif @user.activate!
      flash[:success] = "Account activated."
      redirect_to(root_path)
    else
      render :edit
    end
	end
end
