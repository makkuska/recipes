# == Schema Information
#
# Table name: people
#
#  id   :integer          not null, primary key
#  name :string(255)
#

class Person < ActiveRecord::Base
  validates :name, presence: true
  has_many :recipes

  def self.all_names
    all.map {|cat| cat.name}
  end
end
