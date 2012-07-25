class CreateJcTerms < ActiveRecord::Migration
  def change
    create_table :jc_terms do |t|
      t.date :start_date

      t.timestamps
    end
    add_index :jc_terms, :start_date, :unique => true
  end
end
