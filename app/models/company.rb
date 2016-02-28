class Company < ActiveRecord::Base
  has_many :drugs
  has_many :trials, through: :drugs
end
