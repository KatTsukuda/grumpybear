class ActionTaker < ApplicationRecord
  belongs_to :campaign

  validates :first_name, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }, :on => :create,
            presence: true,
            length: { maximum: 50 }

  validates :last_name, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }, :on => :create,
            presence: true,
            length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
            presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  # Export action-takers data to csv
  def self.to_csv
    attributes = %w{id email first_name last_name country}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |action_taker|
        csv << attributes.map{ |attr| action_taker.send(attr) }
      end
    end
  end

  def name
    "#{first_name} #{last_name}"
  end

  # def action_taken
  #   Time.now
  #   # Time.zone = "Pacific Time (US & Canada)"
  #   # t = Time.zone.now
  #   # t.strftime "%I:%M:%S %p"
  # end
end
