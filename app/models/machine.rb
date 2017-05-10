class Machine < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :tipe
end
