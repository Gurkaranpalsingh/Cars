class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :model
      t.string :description
      t.integer :quantity
      t.decimal :price
      t.string :licenseplate
      t.integer :year
      t.integer :doorCount
      t.decimal :mileage
      t.references :manufacturer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
