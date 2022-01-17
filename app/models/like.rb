# == Schema Information
#
# Table name: likes
#
#  post_id :integer          not null
#  user_id :integer          not null
#
class Like < ApplicationRecord
  belongs_to :post ,class_name:"Post"
  belongs_to :user ,class_name:"User"

  def self.getLike(postID)
    query = <<-SQL
      SELECT count(*) as numberOfLike
      FROM likes
      WHERE post_id = #{postID}
      GROUP BY post_id
    SQL

    result = Like.find_by_sql(query)
    return result

  end

  def self.getUserLike(postID)
    query = <<-SQL
      SELECT user_id as id
      FROM likes
      WHERE post_id = #{postID}
    SQL

    result = Like.find_by_sql(query)
    res = []
    result.each do |r|
      res = res + [User.find(r["id"])]
    end
    return res
  end
end
