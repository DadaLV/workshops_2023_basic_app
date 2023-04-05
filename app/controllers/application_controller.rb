class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def flash_notice
    I18n.t(:notice, scope: [:controllers, controller_name, action_name])
  end
end
