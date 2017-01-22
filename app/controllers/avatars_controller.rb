class AvatarsController < ApplicationController
  def destroy
    Avatar.find(params[:id]).destroy
    redirect_to edit_customer(current_customer)
  end
end
