class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.integer :user_id
      t.string :title, null:false
      t.text :content, null:false
      t.string :image_id, null: false 
      t.integer :span, null: false
      t.string :tech, null: false
      t.string :commitment, null: false
      t.string :github
      t.string :link
      t.timestamps
    end
  end
end
