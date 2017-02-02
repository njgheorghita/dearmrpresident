class CreatePoliticians < ActiveRecord::Migration[5.0]
  def change
    create_table :politicians do |t|
      t.string :name
      t.string :party
      t.string :state
      t.string :image
      t.string :address
      
      t.timestamps
    end
  end
end
