# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string(255)
#  name            :string(255)
#  password_digest :string(255)
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
