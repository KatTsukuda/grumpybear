class Campaign < ApplicationRecord
  belongs_to :user
  has_many :action_takers

  validates :category,  presence: true, length: { maximum: 50 }
  validates :campaign_title,  presence: true, length: { maximum: 50 }
  validates :description,  presence: true, length: { maximum: 500 }
  validates :call_to_action,  presence: true, length: { maximum: 200 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :target_email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :target_name, presence: true, length: {maximum: 225}
  validates :target_signers_goal,  presence: true, length: { maximum: 30 }

  # friendly id!
  extend FriendlyId
  friendly_id :campaign_title

end
