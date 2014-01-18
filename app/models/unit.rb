# == Schema Information
#
# Table name: units
#
#  id   :integer          not null, primary key
#  name :string(255)
#

class Unit < ActiveRecord::Base
  validates :name, presence: true

  def self.all_names
    all.map {|cat| cat.name}
  end
end
