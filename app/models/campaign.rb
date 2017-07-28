class Campaign < ApplicationRecord

  belongs_to :user
  has_many :action_takers

  # carrierwave! image uploader gem :D
  validates_presence_of :image
  validate :image_size_validation
  mount_uploader :image, ImageUploader

  validates :category,  presence: true, length: { maximum: 50 }
  validates :campaign_title,  presence: true, length: { maximum: 50 }
  validates :description,  presence: true, length: { maximum: 2000 }
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

  private
  def image_size_validation
    errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
  end

end
