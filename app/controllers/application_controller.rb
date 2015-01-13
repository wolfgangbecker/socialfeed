class ApplicationController < ActionController::Base
  protect_from_forgery
  set_current_tenant_through_filter
  before_filter :find_current_tenant
  layout :layout_by_resource

  def find_current_tenant
    set_current_tenant(current_user)
  end

  protected
    def layout_by_resource
      if devise_controller?
        "landing"
      else
        "application"
      end
    end
end
