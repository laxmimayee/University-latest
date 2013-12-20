ActiveAdmin.register Student do
  
   controller do
    def permitted_params
      #params.permit student: [:fname,:name,:standard,:image,:thumbnail,:mail]
      #params.permit address: [:Dist,:City,:Pinode,:Descrption]
      params.permit!
    end


      def create
       create!(:notice => "Student has been created") { "/admin/students/new" }
      end

      def update
       update!(:notice => "Student has been updated") { "/admin/students" }
      end



    end
    

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  #permit_params :name, :fname,:gender,:standard,:image
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
      form do |f|
      f.inputs "Student" do
        f.input :name, :label=> "Enter name"
        f.input :fname,:label=> "Enter Surname name"
        f.input :gender, :as => :radio, :collection =>["male","female"]
        f.input :standard, :as => :select, :collection => ["1st","2nd","3rd","4th"]
        f.input :image,:label =>"loadimage",  :as => :file
        f.input :mail, :as => :email
        #f.input :image  #, :hint => f.template.image_tag(f.object.image.url(:thumbnail))
        end

        f.inputs "Address Details", :for => [:address, f.object.address || Address.new] do |t|
        t.input :Dist, :as => :select, :collection => ["hyd","RRd","mbnr","mdk"]
        t.input :City, :as => :select, :collection => ["kkp","sr","apt"]
        t.input :Descrption, :as => :text, :label => "Description", input_html: { rows: "5" }
        t.input :Pincode
      end



      f.actions  #:as => :button

      
      end

      

         
      show do |ad|
      attributes_table do
        row :fname
        row :name
        row :mail
        row :image do
           image_tag ad.image.url, class: 'my_image_size'
        end

      row :Dist do
        
         ad.address.Dist
      end

      row :City do
            ad.address.City
      end

      row :Pincode do
            ad.address.Pincode
      end

      end
     
      active_admin_comments


    end
    
    index do 
      column :name
      column :fname
      column :gender
      column :standard
      column :image_file_name 
      
      

      
      default_actions
    end

  filter :name
  filter :fname, :as => :select
  filter :mail, :as => :select
  filter :address, :label => 'Dist', :collection => Address.all.map(&:Dist ).uniq


end
