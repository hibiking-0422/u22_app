class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.integer :user_id
      t.string :answer
      t.string :field
      t.string :fin_field
      t.string :question
      t.string :study_day
      t.timestamps
    end
  end
end
