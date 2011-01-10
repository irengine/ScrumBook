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
         redirect_to(:action=>'index')
      else
        redirect_to( :action => "new" ,:Messages =>"用户添加失败!")
      end
  end

  def update
    
    @user=User.find_by_id(params[:id])

    if(params[:id]==getUserId().to_s)
      @oldPwd=params["oldPwd"]
      @newPwd=params["newPwd"]
      @cfmPwd=params["cfmPwd"]
      if(@oldPwd!=nil && @oldPwd.length>0)
        @user=User.authenticate(getUserName(),@oldPwd)
        if(@user!=nil)
          if(@newPwd!=@cfmPwd)
            redirect_to(:action=>'edit',:Messages => '两次输入的密码不一样!')
            return
          else
            @user.password=@newPwd
          end
        else
          redirect_to(:action=>'edit',:Messages => '密码验证失败!')
          return
        end
      end
    else
      @password=params["UserPassword"]
      if(@password!=nil && @password.length>0)
         @user.password=@password
      end
    end

    @user.email=params["email"]
    @user.full_name=params["full_name"]
    if (@user.save())
       redirect_to(:action=>'edit',:Messages => '信息保存成功!')
    else
        redirect_to(:action=>'edit',:Messages => '信息保存失败!')
    end
  end
end
