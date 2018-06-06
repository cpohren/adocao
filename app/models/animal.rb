
class Animal < ActiveRecord::Base
  has_many_attached :files 
  belongs_to :user
  
  extend Enumerize
  enumerize :kind, in: [:dog, :cat, :other]
  enumerize :gender, in: [:male, :female]
  enumerize :size, in: [:small, :mid, :big]
end

