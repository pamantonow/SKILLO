class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :city
      t.string :state
      t.integer :zip
      t.integer :st_num
      t.string :st_name
      t.string :phone
      t.string :occupation
      t.string :education
      t.string :description
      t.string :avatar
      t.float :longitude
      t.float :latitude

      t.timestamps null: false
    end
  end
end
