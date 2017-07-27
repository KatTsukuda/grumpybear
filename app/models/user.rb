class User < ApplicationRecord
  has_many :campaigns

  ####################
  # # Validations!! ##
  ###################

  # before_save { self.email = email }
  validates :org_name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  # PASSWORD FUN!
  PASSWORD_FORMAT = /\A
    (?=.*\d)           # Must contain a digit
    (?=.*[a-z])        # Must contain a lower case character
    (?=.*[A-Z])        # Must contain an upper case character
    (?=.*[[:^alnum:]]) # Must contain a symbol
  /x

  validates :password, presence: true,
            length: { in: 6..20 },
            format: { with: PASSWORD_FORMAT,
            message: "must contain a digit, a lower case character, an upper case character, and a symbol." },
            on: [:create, :update]

  has_secure_password

  # Friendly ID for users!
  extend FriendlyId
  friendly_id :org_name, use: [:slugged, :finders]

end
