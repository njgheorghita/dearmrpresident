class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :uid
      t.string :email
      t.string :image
      t.string :address
      t.string :state
      t.string :zipcode

      t.timestamps
    end
  end
end
