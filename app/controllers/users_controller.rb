class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  before_action :costil, only: [:show]

  # GET /users/1
  def show
    @user = User.find(params[:id])
  end

  # GET /users/1/edit
  def edit
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  private
  def set_user
    @user = current_user
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:name, :email)
  end

  # TODO переделать этот шит
  def costil
    if params[:id] == "sign_out"
      sign_out current_user

      reject_user
    end
  end
end
