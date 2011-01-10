class WelcomesController < ApplicationController
  # GET /welcomes
  # GET /welcomes.xml
  def index
    if(getUserId()==nil or getUserId=="")
      respond_to do |format|
        format.html {render :layout => false} # index.html.erb
        format.xml  { render :xml => @welcomes }
      end
    else
      redirect_to(:controller => "products",:action =>"index")
    end
  end

end
