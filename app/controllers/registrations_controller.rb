class RegistrationsController < Devise::RegistrationsController
  def create
    flash[:notice] = "Check for your confirmation email to activate your account"
    super
  end
end
