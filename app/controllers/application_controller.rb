class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :layout_by_resource

  protected

  def layout_by_resource
  	if devise_controller?
  		"devise_layout"
  	else
  		"application"
  	end
  end

  def admin_authorize!
    unless user_signed_in? && current_user.try(:admin)
      redirect_to root_path, :notice => "Acceso no permitido si no eres administrador"
    end
  end
end
