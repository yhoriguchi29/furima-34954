class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :category_id
      t.integer :condition_id
      t.integer :shipCharge_id
      t.integer :shipArea_id
      t.integer :shipDate_id
      t.integer :sales_price
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
