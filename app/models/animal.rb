
class Animal < ActiveRecord::Base
  has_many_attached :files 
  belongs_to :user
end