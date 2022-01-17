# == Schema Information
#
# Table name: like_comments
#
#  id         :bigint           not null, primary key
#  comment_id :integer          not null
#  user_id    :integer          not null
#
class LikeComment < ApplicationRecord
  belongs_to :comment , class_name:"Comment"
  belongs_to :user , class_name:"User"

  
end
