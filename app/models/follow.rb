# == Schema Information
#
# Table name: follows
#
#  followee_id  :integer          not null
#  following_id :integer          not null
#
class Follow < ApplicationRecord

  belongs_to :followee  ,  class_name:"User"
  belongs_to :following , class_name:"User"




end
