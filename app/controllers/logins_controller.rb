# encoding: utf-8
class LoginsController < ApplicationController
  # GET /logins
  # GET /logins.xml
  def index  
    respond_to do |format|
      format.html {render :layout => false} # index.html.erb
      format.xml  { render :xml => @logins }
    end
  end
  
  def validate
    @userName=params["userName"]
    @passwords=params["passwords"]
    @user=User.authenticate(@userName,@passwords)
    if(@user!=nil)
      writeSession("UserName",@user.name)
      writeSession("UserId",@user.id)
      redirect_to(:controller => "products",:action => "index")
    else
      redirect_to(:action=>'index',:ErrorMessage => '用户名或密码错误!.')
    end
  end

  def logout
    writeSession("UserId","")
    writeSession("UserName","")
    writeSession("ProductCode","")
    redirect_to(:controller=> 'welcomes', :action=> 'index')
  end
end
