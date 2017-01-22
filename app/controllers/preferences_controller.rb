class PreferencesController < ApplicationController

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.preference.update(preferences_params)
    redirect_to @customer
  end

  private
  def preferences_params
    params[:preference][:metric] = params[:preference][:metric] == "true" unless params[:preference][:metric].nil?
    params.require(:preference).permit(:metric)
  end

end
