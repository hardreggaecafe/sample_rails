class Task < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
  ["created_at", "description", "duedate", "id", "label", "name", "status", "updated_at"]
  end
end
