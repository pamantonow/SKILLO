class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :sender, index: true
      t.references :receiver, index: true
      t.text :content
      t.integer :rating


      t.timestamps null: false
    end
  end
end
