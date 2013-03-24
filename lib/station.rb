class Station < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true

  has_and_belongs_to_many :lines


  def to_s
    "#{self.id}. #{self.name}"
  end
end