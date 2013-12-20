class DeleteColumnImageStudent < ActiveRecord::Migration
  def change
    remove_column :students,:image,:string
  end
end
