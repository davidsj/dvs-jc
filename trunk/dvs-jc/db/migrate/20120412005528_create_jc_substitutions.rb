class CreateJcSubstitutions < ActiveRecord::Migration
  def change
    create_table :jc_substitutions do |t|
      t.date :day
      t.references :student

      t.timestamps
    end
    add_index :jc_substitutions, [:student_id, :day], :unique => true
  end
end
