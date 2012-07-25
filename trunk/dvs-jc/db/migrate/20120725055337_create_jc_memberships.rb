class CreateJcMemberships < ActiveRecord::Migration
  def change
    create_table :jc_memberships do |t|
      t.references :student
      t.references :jc_term

      t.timestamps
    end
    add_index :jc_memberships, :student_id
    add_index :jc_memberships, [:jc_term_id, :student_id], :unique => true
  end
end
