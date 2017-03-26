class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_users, only: [:edit, :update, :destroy]

  load_and_authorize_resource

  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def create
     
     @user = User.create(user_params)
     @user.skip_password_validation = true

     respond_to do |format|
       if @user.save   
         format.html { custom_path(@user) }
       else
         format.html { render :action => "new" }
       end
     end
  end

  def edit
    
  end

  def agent_list
    @users = User.agents
  end

  def customer_list
     @users = User.customers
  end   

  def update
    if user_params[:password].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end

    # https://github.com/plataformatec/devise/wiki/How-To%3a-Allow-users-to-edit-their-account-without-providing-a-password
    successfully_updated = if needs_password?(@user, user_params)
                             @user.update(user_params)
                           else
                             @user.update_without_password(user_params)
                           end

    respond_to do |format|
      if successfully_updated
        format.html { redirect_to admin_users_path, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
     @user.destroy
     respond_to do |format|
       format.html { redirect_to(admin_users_path) }
       format.xml  { head :ok }
     end
  end

  private 
    def set_users
      @user = User.find(params[:id])
    end 

    def user_params
      params.required(:user).permit(:username, :email,:password, :password_confirmation, :first_name, :last_name, :user_type)
    end

    # https://github.com/plataformatec/devise/wiki/How-To%3a-Allow-users-to-edit-their-account-without-providing-a-password
    def needs_password?(user, params)
      params[:password].present?
    end

    def custom_path(user)
      if user.user_type.eql?('agent')
        redirect_to agent_list_admin_users_path, notice: 'Agent was successfully created.'
      else
        redirect_to customer_list_admin_users_path, notice: 'Customer was successfully created.'
      end  
    end  
end
