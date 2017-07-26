class User < ApplicationRecord
  # Friendly ID for users!
  extend FriendlyId
  friendly_id :org_name, use: [:slugged, :finders]

  has_many :campaigns
  has_many :action_takers

  has_secure_password

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest) == password
  end

end
