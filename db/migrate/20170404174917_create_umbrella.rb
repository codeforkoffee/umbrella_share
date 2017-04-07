class CreateUmbrella < ActiveRecord::Migration[5.0]
  def change
    create_table :umbrellas do |t|
      # t.belongs_to :user, null: false, foreign_key: true
      t.datetime :time, null: false
      t.string :address_1, null: false
      t.string :address_2, null: false
      t.integer :zipcode

      t.timestamps
    end
  end
end
