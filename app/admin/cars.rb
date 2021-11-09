ActiveAdmin.register Car do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :model, :description, :quantity, :price, :licenseplate, :year, :doorCount, :mileage, :manufacturer_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:model, :description, :quantity, :price, :licenseplate, :year, :doorCount, :mileage, :manufacturer_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
