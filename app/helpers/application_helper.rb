module ApplicationHelper

  # return a working title for each page
  def full_title(page_title = '')
    base_title = 'Ruby on Rails Sample App'

    if page_title.empty?
      base_title

    else
      page_title + " | " + base_title
    end
  end
  
end
