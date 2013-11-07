class Book < ActiveRecord::Base
  scope :titled, ->(q) { where 'title like ?', "%#{q}%" }
  has_one :publisher
  accepts_nested_attributes_for :publisher
end
