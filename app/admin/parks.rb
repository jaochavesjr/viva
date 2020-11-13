ActiveAdmin.register Park do

  config.create_another = true

  permit_params :name, :state_id, :city_id, :description, :contact_one, :contact_two, :email, :status


  form do |f|
    f.inputs "Viva Vaquejada" do
      f.input :name
      f.input :state
      f.input :city
      f.input :status, as: :select, collection: Park.statuses.keys, selected: object.status = "active"
      f.input :description, as: :quill_editor
      f.input :contact_one
      f.input :contact_two
      f.input :email
    end
    f.actions
  end

  controller do

    def permitted_params
      params.permit!
    end

    def cities_by_state
      puts "oiii #{params}"
      state_id = params[:id].to_i
      cities = City.where(:state_id => state_id)
      cty = []
      cities.each do |city|
        cty << {:id => city.id, :n => city.name}
      end
      render :json => {:cty => cty.compact}.as_json
    end
  end
end
