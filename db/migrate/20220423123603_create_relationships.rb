class CreateRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :relationships do |t|
      t.integer :following_id
      t.integer :follower_id
      t.index [:follower_id, :following_id], unique: true
      t.timestamps
    end
  end
end
