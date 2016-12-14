ActiveAdmin.register BadgeClaim do
  menu priority: 99
  permit_params :badge_id, :user_id

  filter :badge

  action_item :create_many do
    link_to 'Create Many', admin_utilities_path
  end

  form do |f|
    f.semantic_errors(*f.object.errors.keys)
    f.inputs do
      f.input :badge
      f.input :user
    end
    f.actions
  end

  index do
    selectable_column
    column :badge
    column :user
    column :created_at
    column :updated_at
    actions
  end

  show do |f|
    attributes_table do
      row :badge do |b|
        b.badge.name
      end
      row :user do |b|
        if b.user.nil?
          nil
        else
          b.user.display_name
        end
      end
    end
  end
end
