class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.integer :skill_id
      t.boolean :accepted
      t.string :content

      t.timestamps null: false
    end
  end
end

