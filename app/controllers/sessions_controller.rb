class SessionsController < Devise::SessionsController

def new
  super
end

def create
  self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    unless session[:return_to].blank?
      page =  session[:return_to]
      session[:return_to] = nil
    end
  
    if resource.is_admin? 
      page ? redirect_to page : redirect_to admin_menu_index_path
    else
      page ? redirect_to page : after_sign_in_path_for(resource)
    end
  end
end
