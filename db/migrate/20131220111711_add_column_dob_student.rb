class AddColumnDobStudent < ActiveRecord::Migration
  def change
  	add_column :students, :DOB,:date
  end
end
