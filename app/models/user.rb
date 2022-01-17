# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string(255)
#  name            :string(255)
#  password_digest :string(255)
#
class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_one_attached :avatar



  has_many :match_followees ,foreign_key: :followee_id , class_name:"Follow"
  has_many :followings ,through: :match_followees

  has_many :match_followers, foreign_key: :following_id , class_name:"Follow"
  has_many :followees , through: :match_followers

  has_many:comments

  has_many:like_comments








  has_secure_password

  def check_email
    if(User.find_by_email(self.email))
      errors.add(:email, "already exists")
      return false
    end
    return true
  end

  def check_name
    if(User.find_by_name(self.name))
      errors.add(:name, "already exists")
      return false
    end
    return true
  end

  def check_password(password_confirmation)

    if(password_confirmation != self.password)
      errors.add(:password,"do not match with password_confirmation")
      return false
    end
    return true

  end

  def login
    @user = User.find_by_email(self.email)
    if(@user)
      if(@user.authenticate(self.password))
        self.id = @user.id
        return true
      else
        errors.add(:password,"incorrect !!!")
        false
      end
    else
      errors.add(:email,"incorrect !!!")
      false
    end
  end

  def get_feed_posts
    query = <<-SQL
    SELECT p.*
    FROM users u,follows f ,posts p
    WHERE f.followee_id = "#{self.id}" and p.user_id = f.following_id and u.id = "#{self.id}"
    order by p.updated_at desc
    SQL

    result = User.find_by_sql(query)
    return result
  end

  def getProfilePosts
    query = <<-SQL
    SELECT p.*
    FROM users u , posts p
    WHERE p.user_id = "#{self.id}" and u.id = "#{self.id}"
    order by p.updated_at DESC
    SQL
    result = User.find_by_sql(query)
    return result
  end

  def self.search(name)
    query = <<-SQL
    SELECT *
    FROM users
    WHERE name LIKE "%#{name}%"
    SQL
    result = User.find_by_sql(query)
    # result = ActiveRecord::Base.connection.execute(query)
    return result
  end








end
