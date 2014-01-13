class Book < ActiveRecord::Base
  scope :titled, ->(q) { where 'title like ?', "%#{q}%" }
  belongs_to :users
  has_many :publishers, dependent: :destroy
  has_many :authors, dependent: :destroy
  has_many :readings, dependent: :destroy
  accepts_nested_attributes_for :publishers
  accepts_nested_attributes_for :authors
end
