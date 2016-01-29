class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.integer :teacher_id
      t.integer :skill_id
      t.string :years_of_expirience
      t.string :hourly_rate
      t.string :description

      t.timestamps null: false
    end
  end
end
