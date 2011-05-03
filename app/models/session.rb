class Session < ActiveRecord::Base
  belongs_to :user

  def self.get(key)
    return Session.where(key: key).includes(:user).first
  end
end
