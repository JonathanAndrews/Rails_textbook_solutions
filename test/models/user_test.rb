require 'test_helper'

class UserTest < ActiveSupport::TestCase
  validates :name, presence: true, uniqueness: true
  has_secure_password
end
