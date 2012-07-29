class UserlistsController < ApplicationController
	before_filter :admin_authorize!

  def index
  	@users = User.all
  end

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  	redirect_to userlists_index_url, :notice => "Usuario eliminado correctamente."

  end
end
