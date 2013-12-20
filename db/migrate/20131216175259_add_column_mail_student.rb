class AddColumnMailStudent < ActiveRecord::Migration
  def change
  	add_column :students, :mail,:string

  	  	#add_column :students,:image, :string
  end
end
