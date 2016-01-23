class UsersController < ApplicationController
  before_action :set_user, except: [:index, :new, :create]

  def index
    @users = User.all.order(:email)
  end

  def new
    @user = User.new
    render '_form', layout: false
  end

  def create
    @user = User.new(user_params)
    temp_password = SecureRandom.hex
    @user.password = temp_password
    @user.password_confirmation = temp_password
    if @user.save
      respond_to do |format|
        format.html { redirect_to users_url, notice: 'User created' }
        format.js
      end
    else
      logger.info @user.errors.full_messages
      render 'new'
    end
  end

  def edit
    render '_form', layout: false
  end

  def update
    if @user.update(user_params)
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    @user.destroy
    head :ok
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit :email
  end
end
