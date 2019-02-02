class Notification < ApplicationRecord
  belongs_to :target, polymorphic: true
  belongs_to :user

  serialize :event, Hash

  before_save :set_event

  scope :unseen, -> { where(acknowledged_at: nil) }

  def opened?
    !opened_at.nil?
  end

  def set_event
    raise '#set_event must be implemented by the subclasses!'
  end
end
