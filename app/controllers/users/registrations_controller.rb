class Users::RegistrationsController < Devise::RegistrationsController
  def update
    super
    respond_to do |format|
      format.js { render 'notifications/refresh_user_notifications_form', status: :ok}
    end
  end
end