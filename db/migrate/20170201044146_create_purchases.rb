class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.integer :letter_id
      t.string  :description
      t.string  :to_name
      t.string  :to_address_line
      t.string  :to_address_city
      t.string  :to_address_state
      t.string  :to_address_country
      t.string  :to_address_zip
      t.string  :from_name
      t.string  :from_address_line
      t.string  :from_address_city
      t.string  :from_address_state
      t.string  :from_address_county
      t.string  :from_address_zip
      t.string  :file
      t.string  :data
      t.boolean :color
      
      t.timestamps
    end
  end
end
