class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.references :order,         null: false, foreign_key: true
      t.string     :post_code,     null: false
      t.integer    :prefecture_id, null: false
      t.string     :town,          null: false
      t.string     :address,       null: false
      t.string     :building_name
      t.string     :tel,           null: false
      t.timestamps
    end
  end
end
