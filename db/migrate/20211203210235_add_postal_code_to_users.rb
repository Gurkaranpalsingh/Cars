class AddPostalCodeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :postalCode, :string
  end
end
