class CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    respond_to do |format|
      format.html {}
      format.json {}
    end
  end

  def edit
    @customer = Customer.find(current_customer.id)
    @customer.build_profile unless @customer.profile
    @customer.build_preference unless @customer.preference
    @customer.customer_languages.build unless @customer.customer_languages
    @customer.customer_desires.build unless @customer.customer_desires
    @customer.profile.avatars.build
    @customer.customer_ethnicities.build unless @customer.customer_ethnicities

    respond_to do |format|
      format.html {}
      format.json {}
    end
  end

  def update
    @customer = Customer.find_by(id: params[:id])
    if @customer.update(customer_params)
      if params[:customer][:profile_attributes].present? && params[:customer][:profile_attributes][:default_avatar_id].present?
        @avatar = Avatar.find_by(id: params[:customer][:profile_attributes][:default_avatar_id])
        render :crop
      else
        redirect_to @customer, notice: "Successfully updated user."
      end
    else
      redirect_to @customer, notice: "Unable to update user."
    end
  end

  private

  def customer_params
    permitted = params.require(:customer).permit( :crop_x, :crop_y, :crop_h, :crop_w, profile_attributes: [:id, :smoker, :drinker, :level_of_education, :biography, :star_sign, :occupation, :imperial, :metric, :customer_id, :default_avatar_id,
      avatars_attributes: [:id, :avatar, :caption]], language_ids: [], desire_ids: [], ethnicity_ids: [], religion_ids: [] )
    unless permitted[:profile_attributes].nil?
      unless permitted[:profile_attributes][:avatars_attributes].nil?
        permitted[:profile_attributes][:avatars_attributes].each do |k,v|
          permitted[:profile_attributes][:avatars_attributes].delete k if v[:id].nil? && v[:avatar].nil?
        end
      end
    end
    permitted
  end

end
