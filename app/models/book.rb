class Book < ActiveRecord::Base
  scope :titled, ->(q) { where 'title like ?', "%#{q}%" }
  has_many :publishers
  accepts_nested_attributes_for :publishers
end
