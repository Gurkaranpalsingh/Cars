class CreateContactUs < ActiveRecord::Migration[6.1]
  def change
    create_table :contact_us do |t|
      t.string :title
      t.string :content
      t.string :permalink

      t.timestamps
    end
  end
end
