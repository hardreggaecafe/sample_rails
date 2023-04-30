class Task < ApplicationRecord
  enum :status, { created: 0, ready: 1, in_progress: 2, pending: 3, done: 4, canceled: 5 }
end
