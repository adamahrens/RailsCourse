class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  def index
    @users = User.all
  end

  def edit
    authorize @user
  end

  def show
  end

  def edit
    @rolls = Role.all
  end

  def update
    authorize @user
    respond_to do |format|
      if @user.update(user_params)
         @user.create_activity key: 'user.edited_roles', owner: current_user
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        @rolls = Role.all
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user
    @user = User.friendly.find(params[:id])
  end

  def user_params
    params.require(:user).permit({ role_ids: []})
  end
end
