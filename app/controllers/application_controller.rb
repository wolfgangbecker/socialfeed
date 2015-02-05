class ApplicationController < ActionController::Base
  protect_from_forgery
  set_current_tenant_through_filter
  before_filter :setup
  layout :layout_by_resource

  def find_current_tenant
    set_current_tenant(current_user)
  end

  def set_followings
    @followings = FollowingDecorator.decorate_collection(Following.all)
  end

  def setup
    find_current_tenant
    set_followings
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
