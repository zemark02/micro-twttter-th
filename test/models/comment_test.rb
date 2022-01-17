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
require "test_helper"

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
