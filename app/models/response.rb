class Response < ApplicationRecord
	belongs_to :user
  mount_uploader :picture, PictureUploader


  def check_answer

  	if self.round_number = 4
  		check_book_answer

  	else

	    clue = Clue.find_by(stop: self.round_number)
	    correct_answer = clue.answer
	    guess = self.guess.downcase.gsub(/\s+/, "")
	    guess = guess.tr('^A-Za-z0-9', '')

	    if correct_answer == guess
	      update_attribute(:correct, true)
	      return true
	    else
	      return false
	    end
	  end
  end


  def check_book_answer

  	answer_bin = %w(ride knew neuralgia negotiate across admitted publishing have felt your company
  	with about private admission aid clearly look hosted art country)

    guess = self.guess.downcase.gsub(/\s+/, "")
    guess = guess.tr('^A-Za-z0-9', '')

    if answer_bin.include?(guess)
      update_attribute(:correct, true)
      return true
    else
      return false
    end
  end




end
