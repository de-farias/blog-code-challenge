module Notifications
  class PostCreated < ::Notification
    private

    def set_event
      self.event = {
        type: 'post_created',
        text: event_text,
        url: event_url
      }
    end

    def event_text
      title = ActionController::Base.helpers.sanitize(target.title)

      "Novo post: #{title}"
    end

    def event_url
      Rails.application.routes.url_helpers.post_path(target)
    end
  end
end
