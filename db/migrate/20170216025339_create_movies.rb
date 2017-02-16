class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :synopsis
      t.decimal :rent_price, precision: 10, scale: 2
      t.boolean :is_rented

      t.timestamps
    end
  end
end
