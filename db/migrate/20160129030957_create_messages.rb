class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :user
      t.references :request
      t.string :content

      t.timestamps null: false
    end
  end
end

# Message.create(user_id: 1, request_id: 1 , content: "also if you can message me as soon as possible when you get request.")