class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.integer :teacher_id, index: true
      t.integer :skill_id, index: true
      t.integer :years_of_experience
      t.integer :hourly_rate
      t.string :description

      t.timestamps null: false
    end
  end
end
