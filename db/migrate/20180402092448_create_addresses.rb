class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :street
      t.integer :zip_code
      t.integer :customer_id

      t.timestamps
    end
  end
end
