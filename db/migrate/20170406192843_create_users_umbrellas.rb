class CreateUsersUmbrellas < ActiveRecord::Migration[5.0]
  def change
    create_table :users_umbrellas do |t|
      t.references :user, foreign_key: true
      t.references :umbrella, foreign_key: true

      t.timestamps
    end
  end
end
