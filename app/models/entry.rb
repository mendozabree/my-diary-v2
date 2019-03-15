class Entry < ApplicationRecord
  validates_presence_of :title, :description, :body
end
