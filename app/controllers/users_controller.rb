class UsersController < ApplicationController
  before_action :authenticate_agent!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    if !params[:status].blank?
      @users = @users.where( :status=>params[:status] )
      @status = params[:status]
    end

    if !params[:state].blank?
      @users = @users.where( :state=>params[:state] )
      @state = params[:state]
    end

    if !params[:search].blank?
      @search = params[:search]
      @users = @users.where("first_name LIKE ? OR last_name LIKE ? OR email LIKE ? OR fb_id LIKE ?", "%#{@search}%", "%#{@search}%", "%#{@search}%", "%#{@search}%")
    end
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def activate_user
    @user = User.find(params[:format])
    @user.activate?
    redirect_to user_path(@user)
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :fb_id, :username, :email, :country, :status, :state)
    end
end
