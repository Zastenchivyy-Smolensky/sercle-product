class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.integer :user_id
      t.string :title
      t.text :content
      t.string :image_id
      t.integer :span
      t.string :tech

      t.timestamps
    end
  end
end
