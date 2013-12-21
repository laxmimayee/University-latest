class RenameTeachersStudents < ActiveRecord::Migration
  def change
  	rename_column :students, :teachers_id, :teacher_id
  end
end
