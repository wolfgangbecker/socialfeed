class ApplicationController < ActionController::Base
  protect_from_forgery
  set_current_tenant_through_filter
  before_filter :setup
  layout :layout_by_resource
  before_filter :authenticate_user!
  rescue_from SQLite3::BusyException, with: :database_locked

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

  def database_locked
    redirect_to :back, alert: I18n.t('errors.messages.could_not_process')
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
