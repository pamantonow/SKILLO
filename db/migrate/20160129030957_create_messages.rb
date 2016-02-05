class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :user, index: true
      t.references :request, index: true
      t.string :content

      t.timestamps null: false
    end
  end
end

