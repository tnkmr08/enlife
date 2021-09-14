class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :text,                 null: false
      t.integer :category_id,       null: false
      t.string :place_name,         null: false
      t.references :user,           null: false, foreign_key: true 
      t.timestamps
    end
  end
end
