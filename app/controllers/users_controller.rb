class UsersController < ApplicationController
  before_action :set_user, only: %i(show edit update destroy)
  before_action :require_admin, only: %i(index destroy)
  before_action :require_self, only: %i(show edit update), unless: -> { current_user&.admin? }

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      @user.update!(admin: true) if User.count == 1
      auto_login(@user)
      redirect_to products_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: 'User was successfully destroyed.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def require_admin
    return if current_user&.admin?
    flash[:error] = 'You must be an admin to do that.'
    redirect_to products_path
  end

  def require_self
    return if @user == current_user
    flash[:error] = 'You must be an admin to do that.'
    redirect_to products_path
  end
end
