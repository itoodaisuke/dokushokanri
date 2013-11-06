class Book < ActiveRecord::Base
  scope :titled, ->(q) { where 'title like ?', "%#{q}%" }
  belongs_to :publisher
  accepts_nested_attributes_for :publisher
end
