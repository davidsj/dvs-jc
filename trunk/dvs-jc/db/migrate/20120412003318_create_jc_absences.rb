class CreateJcAbsences < ActiveRecord::Migration
  def change
    create_table :jc_absences do |t|
      t.date :day
      t.references :student

      t.timestamps
    end
    add_index :jc_absences, :student_id
  end
end
