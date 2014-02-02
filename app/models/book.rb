class Book < ActiveRecord::Base
  belongs_to :user
  has_many :publishers, dependent: :destroy
  has_many :authors, dependent: :destroy
  has_many :readings, dependent: :destroy
  accepts_nested_attributes_for :publishers
  accepts_nested_attributes_for :authors
  accepts_nested_attributes_for :readings
end
