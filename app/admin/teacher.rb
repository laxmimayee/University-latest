ActiveAdmin.register Teacher do
  controller do
    def permitted_params
      params.permit!
    end

    def create
       create!(:notice => "Teacher has been created") { "/admin/teachers/new" }
      end

      def update
       update!(:notice => "Teacher has been updated") { "/admin/teachers" }
      end

end

 show do |i|
      attributes_table do
        row :fname
        row :name
        row :DOB
        row :picture do
           image_tag i.picture.url, class: 'my_image_size'
        end

      row :Dist do
        
         i.address.Dist
      end

      row :City do
            i.address.City
      end

      row :Pincode do
            i.address.Pincode
      end

      end
     
      active_admin_comments


    end



index do 
      column :id
      column :name
      column :fname
      column :gender
      column :picture_file_name,:label=> "Teacher Photo"
      column :DOB
      
      default_actions
    end

form do |f|
      f.inputs "Teacher" do
        f.input :name, :label=> "Enter name"
        f.input :fname,:label=> "Enter Surname name"
        f.input :gender, :as => :radio, :collection =>["male","female"]
        f.input :expereince, :label=> "Enter Numbers of expreince"
        #f.input :DOB, :label => "Date-Of-Birth",:as => :datepicker

        f.input :picture,:label =>"loadimage",  :as => :file
        #f.input :mail, :as => :email
         f.input :DOB, :label => "Date-Of-Birth", :as => :date_select, :start_year => 1900, :end_year => Date.current.year
        end


        f.inputs "Student Details", :for => [:students, f.object.students || Student.new] do |s|
        s.input :name, :as => :select, :include_blank => "--select--", :collection => Student.all.map(&:name).uniq
        
      end

        f.inputs "Address Details", :for => [:address, f.object.address || Address.new] do |t|
        t.input :Dist, :as => :select, :collection => ["hyd","RRd","mbnr","mdk"]
        t.input :City, :as => :select, :collection => ["kkp","sr","apt"]
        t.input :Descrption, :as => :text, :label => "Description", input_html: { rows: "5" }
        t.input :Pincode
      end

      


      f.actions
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
 
end

  filter :name
  filter :fname, :as => :select
  filter :gender, :as => :select
  filter :expereince, :as => :select


end
