# == Schema Information
#
# Table name: comments
#
#  id           :bigint           not null, primary key
#  comment_post :text(65535)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  post_id      :integer          not null
#  user_id      :integer          not null
#
class Comment < ApplicationRecord
  belongs_to:post , class_name:"Post"
  belongs_to:user , class_name:"User"

  has_many :match_like_comment ,foreign_key: :comment_id , class_name:"LikeComment"
  has_many :likes ,through: :match_like_comment ,source: :user

end
