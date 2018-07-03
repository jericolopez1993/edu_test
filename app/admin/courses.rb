ActiveAdmin.register Course do
  permit_params :name, professors_attributes: [:id, :name, :_destroy]

  index do
    selectable_column
    id_column
    column :name
    column :created_at
    actions
  end

  filter :name
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
    end
    f.inputs do
      f.has_many :professors, heading: 'Professors',
          allow_destroy: true,
          new_record: true do |a|
      a.input :name
    end
  end
    f.actions
  end

end
