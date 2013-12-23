ActiveAdmin.register AdminUser do
  #permit_params :email, :password, :password_confirmation


controller do
    def permitted_params
      #params.permit student: [:fname,:name,:standard,:image,:thumbnail,:mail]
      #params.permit address: [:Dist,:City,:Pinode,:Descrption]
      params.permit!
    end

      
      def create
       create!(:notice => "Admin has been created") { "/admin/admin_users/new" }
      end

      def update
       update!(:notice => "Admin has been updated") { "/admin/admin_users" }
      end



    end
    




  index do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  filter :email

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
