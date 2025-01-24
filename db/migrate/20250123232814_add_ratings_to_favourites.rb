class AddRatingsToFavourites < ActiveRecord::Migration[7.1]
  def change
    add_column :favourites, :rating, :integer, default: 0, null: false
  end
end
