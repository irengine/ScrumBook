# encoding: utf-8
class UsersController < ApplicationController
  before_filter :login
  # GET /users
  # GET /users.xml
  def index
    @users = User.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end
  def edit    
    @user=User.find_by_id(params[:id])
  end

  def new
    @user = User.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

    def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to(:controller=>"users",:action=>'index')
    else
      flash[:notice]=I18n.t(:user_add_error)
      redirect_to(:controller=>"users",:action=>'new')
    end
  end

  def update
    @user=User.find_by_id(params[:id])
    if(params[:id]==get_UserId().to_s)
      @old_pwd=params[:old_pwd]
      if(@old_pwd.nil? && @old_pwd.empty?)
        @user=User.authenticate(get_UserName(),@old_pwd)
        if(@user.nil?)
          redirect_to(:action=>'edit',:messages =>  I18n.t(:user_authenticate_error))
          return
        end
      end
    end
    if (@user.update_attributes(params[:user]))
       redirect_to(:action=>'edit',:messages => I18n.t(:user_update_succeed))
    else
        redirect_to(:action=>'edit',:messages => I18n.t(:user_update_error))
    end
  end
end
