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
