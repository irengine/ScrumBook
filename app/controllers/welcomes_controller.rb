class WelcomesController < ApplicationController
  # GET /welcomes
  # GET /welcomes.xml
  def index
    if(get_UserId()==nil or get_UserId()=="")
      respond_to do |format|
        format.html {render :layout => false} # index.html.erb
        format.xml  { render :xml => @welcomes }
      end
    else
      redirect_to(:controller => "products",:action =>"index")
    end
  end

end
