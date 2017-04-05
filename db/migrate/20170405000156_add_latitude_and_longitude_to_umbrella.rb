class AddLatitudeAndLongitudeToUmbrella < ActiveRecord::Migration[5.0]
  def change
    add_column :umbrellas, :latitude, :float
    add_column :umbrellas, :longitude, :float
  end
end
