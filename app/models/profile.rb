class Profile < ActiveRecord::Base
  belongs_to :user

  validates :first_name, presence: true, if: "last_name.nil?"
  validates :last_name, presence: true, if: "first_name.nil?"
  validates :gender, inclusion: { in: %w(male female)}
  validate :boy_name_sue

  def boy_name_sue
    if gender == 'male' && first_name =='Sue'
      errors.add(:first_name, "As a male, we think Sue is not a right name for you.")
    end
  end

  def self.get_all_profiles(min, max)
    Profile.where(birth_year: min..max).order(:birth_year)
  end
end
