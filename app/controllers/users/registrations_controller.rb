class Users::RegistrationsController < Devise::RegistrationsController
  def update
    User.update current_user.id, params[:user]
    respond_to do |format|
      format.js { render 'notifications/refresh_user_notifications_form', status: :ok}
    end
  end
end