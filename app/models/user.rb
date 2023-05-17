class User < ApplicationRecord
  enum :role, { member: 1, admin: 2 }
  devise :database_authenticatable, :registerable,
         :confirmable, :recoverable, :rememberable, :validatable
  has_many :tasks

  def is_admin?
    self.admin?
  end
end
