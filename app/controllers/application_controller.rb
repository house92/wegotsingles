class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :maybe_login_from_token

  def maybe_login_from_token
    Rails.logger.info "maybe_login_from_token: '#{ params[:login_token] }'"
    return if (token = params[:login_token]).blank?

    if (customer = Customer.find_by(login_token: token))
      Rails.logger.info "One time login token used for customer #{ customer.id }"
      sign_in(customer)
      # strip token regardless of success
      redirect_to "#{request.path}?contact_id=#{params[:contact_id]}",
                  params.except(:login_token, :action, :controller)
    else
      Rails.logger.info "No customer found from token: '#{ token }'"
      redirect_to root_url
    end
  end

end
