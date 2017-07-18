class InsuranceTypeDecorator < Draper::Decorator
  include ActionView::Helpers::UrlHelper
  delegate_all

  def parent?
  	parent_id? ? "No" : "Yes"
  end

  def permalink_url
  	"/#{self.permalink}"
  end
  
  

end