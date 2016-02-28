class Drug < ActiveRecord::Base
  belongs_to :company
  has_many :trials
end
