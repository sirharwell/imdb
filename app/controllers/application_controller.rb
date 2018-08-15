class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :verify_paid

  def verify_paid
    @paid = true
  end
end
