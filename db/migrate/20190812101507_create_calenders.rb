class CreateCalenders < ActiveRecord::Migration[5.2]
  def change
    create_table :calenders do |t|
      t.integer :user_id
      t.integer :study_time
      t.integer :break_time
      t.text :reflection

      t.timestamps
    end
  end
end
