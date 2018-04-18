
class Animal < ActiveRecord::Base
  has_many_attached :files 
end