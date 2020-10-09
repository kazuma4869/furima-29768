class CreatePres < ActiveRecord::Migration[6.0]
  def change
    create_table :pres do |t|
      t.string :house_code,           null:false
      t.integer :prefecture_id,       null:false
      t.string :city,                 null:false
      t.string :house_address,        null:false
      t.string :house_name
      t.string :telephone,            null:false
      t.references :management,       null:false,foreign_key: true
      t.timestamps
    end
  end
end
