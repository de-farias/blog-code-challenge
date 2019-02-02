class ApplicationController < ActionController::Base
  protected

  def set_notifications
    @notifications = OpenStruct.new(
      items: current_user.notifications.order('created_at desc').take(10),
      unseen_count: current_user.notifications.unseen.count
    )
  end
end
