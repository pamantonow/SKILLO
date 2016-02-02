class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :sender
      t.references :receiver
      t.text :content
      t.integer :rating


      t.timestamps null: false
    end
  end
end
