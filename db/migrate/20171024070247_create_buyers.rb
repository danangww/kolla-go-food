class CreateBuyers < ActiveRecord::Migration[5.1]
  def change
    create_table :buyers do |t|
      t.string :email, unique: true
      t.string :name
      t.string :phone, unique: true
      t.string :address
      t.timestamps
    end
    add_index :buyers, [:phone, :email], unique: true
  end
end
