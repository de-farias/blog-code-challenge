class Notification < ApplicationRecord
  belongs_to :target, polymorphic: true
  belongs_to :user

  serialize :event, Hash

  before_save :set_event

  def set_event
    raise '#set_event must be implemented by the subclasses!'
  end
end
