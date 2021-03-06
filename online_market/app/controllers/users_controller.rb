class UsersController < ApplicationController
 before_filter :authorize, :except => [:create]   # authorize filter
  def new
    @user = User.new
  end


 def create
   @user = User.new(params[:user])
   if @user.save
     redirect_to products_path, :notice => 'User creation successful!'
   else
     render :action => 'new'
   end
 end

def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to users_url,
                                  notice: "User #{@user.name} was successfully updated." }
        format.xml { head :no_content }
      else
        format.html { render action: "edit" }
        format.xml { render json: @user.errors,
                             status: :unprocessable_entity }
      end
    end
  end


def index
   @users = User.find (:all)
 end

end






