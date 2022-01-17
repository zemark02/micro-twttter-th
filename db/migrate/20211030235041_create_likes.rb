class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes, id: false do |t|
      t.integer :post_id, null: false, foreign_key: true
      t.integer :user_id, null: false, foreign_key: true

    end
  end
end
