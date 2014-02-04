class Person < ActiveRecord::Base
  validate :name, presence: true
end
