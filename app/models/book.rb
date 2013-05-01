class Book < ActiveRecord::Base
  attr_accessible :name,:author, :status
end
