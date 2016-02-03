class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :sender_id, index: true
      t.integer :receiver_id, index: true
      t.integer :skill_id, index: true
      t.boolean :accepted
      t.string :content

      t.timestamps null: false
    end
  end
end

