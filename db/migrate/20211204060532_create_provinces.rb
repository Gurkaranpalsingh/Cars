class CreateProvinces < ActiveRecord::Migration[6.1]
  def change
    create_table :provinces do |t|
      t.decimal :GST
      t.decimal :PST
      t.decimal :HST
      t.string :name

      t.timestamps
    end
  end
end
