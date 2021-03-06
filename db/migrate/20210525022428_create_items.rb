class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :category_id
      t.integer :condition_id
      t.integer :ship_charge_id
      t.integer :ship_area_id
      t.integer :ship_date_id
      t.integer :sales_price
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
