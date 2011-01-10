class ApplicationController < ActionController::Base
  protect_from_forgery

  def getSessionByKey(key)
    return session[key];
  end

  def writeSession(key,values)
    session[key]=values;
  end

  def getUserName()
    return session["UserName"]
  end

  def getUserId()
    return getSessionByKey("UserId")
  end

  def getUserProductCode()
     return getSessionBykey("ProductCode") 
  end

  def login
     if (session["UserId"].nil? or session['UserId']=="")
       redirect_to :controller=> 'welcomes', :action=> 'index'
     end
  end

end
