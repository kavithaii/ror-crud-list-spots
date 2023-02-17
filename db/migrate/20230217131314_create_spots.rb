class CreateSpots < ActiveRecord::Migration[7.0]
  def change
    create_table :spots do |t|
      t.string :title
      t.string :description
      t.decimal :price, precision: 8, scale: 2
      t.string :list_of_images
      t.string :string

      t.timestamps
    end
  end
end
