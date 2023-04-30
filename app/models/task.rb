class Task < ApplicationRecord
  enum :status, { created: 0, ready: 1, in_progress: 2, pending: 3, done: 4, canceled: 5 }

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "duedate", "id", "label", "name", "status", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
