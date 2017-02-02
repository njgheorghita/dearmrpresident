class CreateLetters < ActiveRecord::Migration[5.0]
  def change
    create_table :letters do |t|
      t.string :user_uid
      t.string :letter_body
      t.string :status

      t.timestamps
    end
  end
end
