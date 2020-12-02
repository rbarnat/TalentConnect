class ApplicationController < ActionController::Base
  before_action do
    I18n.locale = :fr
  end
end
