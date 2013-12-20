class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :fname
      t.boolean :gender
      t.string :standard
      t.timestamps
    end
  end
end
