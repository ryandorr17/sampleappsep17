class Response < ApplicationRecord
	belongs_to :user
  mount_uploader :picture, PictureUploader


  def check_answer
    clue = Clue.find_by(stop: self.round_number)
    correct_answer = clue.answer
    guess = self.guess.downcase.gsub(/\s+/, "")

    if correct_answer == guess
      update_attribute(:correct, true)
      return true
    else
      return false
    end
  end

end
