class CreateUmbrella < ActiveRecord::Migration[5.0]
  def change
    create_table :umbrellas do |t|
      t.integer :owner_id, null: false, index: true
      t.integer :guest_id, null: true, index: true
      t.datetime :time, null: false
      t.string :address_1, null: false
      t.string :address_2, null: false
      t.integer :zipcode

      t.timestamps
    end

    add_foreign_key :umbrellas, :users, column: :owner_id
    add_foreign_key :umbrellas, :users, column: :guest_id
  end
end
