ActiveAdmin.register Subscription do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  permit_params :project_id, :user_id

  index do
    column :project_id
    column :user_id
    actions
  end

  form do |f|
    f.inputs 'Subscription' do
      f.input :project_id
      f.input :user_id
    end
    f.actions
  end
end
