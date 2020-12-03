class ApplicationController < ActionController::Base
  before_action do
    I18n.locale = :fr
  end

  add_flash_types :info, :danger, :warning, :success
end
