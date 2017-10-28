class Team < ApplicationRecord
  has_many :users
	validates :team_name, presence: true, length: {maximum: 140}
	mount_uploader :picture, PictureUploader 
  validate :picture_size


  private

  def picture_size

      if picture.size > 5.megabytes

        errors.add(:picture, "should be less than 5MB")

      end

   end 






end
