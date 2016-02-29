class Drug < ActiveRecord::Base
  belongs_to :company
  belongs_to :indication
  has_many :trials
end
