class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.float :lat
      t.float :lng
      t.boolean :status
      t.string :condition
      t.string :description

      t.timestamps
    end
  end
end
