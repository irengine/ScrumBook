class ApplicationController < ActionController::Base
  protect_from_forgery 

  def get_Session_Key(key)
    return session[key];
  end

  def write_Session(key,values)
    session[key]=values;
  end

  def get_UserName()
    return get_Session_Key("UserName")
  end

  def get_UserId()
    return get_Session_Key("UserId")
  end

  def get_UserProductCode()
     return get_Session_Key("ProductCode") 
  end
    def get_UserProductName()
     return get_Session_Key("ProductName")
  end
  
  def get_UserProductId()
     return get_Session_Key("ProductId")
  end

  def login
     if (session["UserId"].nil? or session['UserId']=="")
       redirect_to :controller=> 'welcomes', :action=> 'index'
     end
  end

end
