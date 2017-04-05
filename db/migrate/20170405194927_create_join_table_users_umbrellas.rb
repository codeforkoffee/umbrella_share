class CreateJoinTableUsersUmbrellas < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :umbrellas do |t|
      t.index :user_id
      t.index :umbrella_id
    end
  end
end
