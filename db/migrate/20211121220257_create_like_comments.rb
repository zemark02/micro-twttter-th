class CreateLikeComments < ActiveRecord::Migration[6.1]
  def change
    create_table :like_comments do |t|
      t.integer :comment_id, null: false, foreign_key: true
      t.integer :user_id, null: false, foreign_key: true
    end
  end
end
