
class Animal < ActiveRecord::Base
  has_many_attached :files 
  belongs_to :user
  
  extend Enumerize
  enumerize :kind, in: [:dog, :cat, :other], scope: true
  enumerize :gender, in: [:male, :female], scope: true
  enumerize :size, in: [:small, :mid, :big], scope: true
  enumerize :city, in: [:taquara, :igrejinha, :parobé, :rolante, :sapiranga], scope: true
  
  scope :neutered, -> (neutered) { where neutered: neutered }
  scope :vaccinated, -> (vaccinated) { where vaccinated: vaccinated }
  #TODO age scope
end

