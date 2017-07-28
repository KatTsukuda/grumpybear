class ActionTaker < ApplicationRecord
  belongs_to :campaign

  validates :first_name, :with => /^[A-Za-z]+$/, :on => :create,
            presence: true,
            length: { maximum: 50 }

  validates :last_name, :with => /^[A-Za-z]+$/, :on => :create,
            presence: true,
            length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
            presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
end
