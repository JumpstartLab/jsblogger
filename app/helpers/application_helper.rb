module ApplicationHelper
  def d(object)
    debug object if Rails.env == "development"
  end
end
