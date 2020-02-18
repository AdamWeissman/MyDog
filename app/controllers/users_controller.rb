class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = user.all
  end

  # GET /users/new
  def new
    @user = user.new
  end

  # GET /users/1
  def show
    if (@user = user.find_by(id: params[:id]))
      authorize(@user)
    else
      not_authorized
    end
  end

  # POST /users
  def create
    if (@user = user.new(user_params))
    if @user.save
      session[:user_id] = @user.id
      # flash[:message] = ' Welcome, #{@user.name}'
      redirect_to user_path(@user)
    else
      render :new
    end
    else
      flash[:message] = "There was an error creating the user."
      redirect_to signup_path
    end
  end

  # GET /users/1/edit
  def edit
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'user was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'user was successfully destroyed.'
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = user.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit([:name, :email, :phone_number, :contact_method, :password, :admin])
    end
end