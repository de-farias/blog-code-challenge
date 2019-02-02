class NotificationsJob < ApplicationJob
  queue_as :notifications

  def perform(notification_type, target, user_id)
    klass(notification_type).create(target: target, user_id: user_id)
  end

  private

  def klass(notification_type)
    Notifications.const_get("Notifications::#{notification_type}")
  end
end
