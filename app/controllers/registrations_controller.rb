class RegistrationsController < Devise::RegistrationsController
	prepend_before_filter :require_no_authentication, :only => [ :cancel ]
	before_filter :admin_authorize!, :only => [:new]

	# POST /resource
  def create
    build_resource

    if resource.save
			redirect_to userlists_index_url, :notice => "Registro realizado correctamente."
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

end