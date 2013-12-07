class Unit < ActiveRecord::Base
  validates :name, presence: true

  def self.all_names
    all.map {|cat| cat.name}
  end
end
