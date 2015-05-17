class Article < ActiveRecord::Base
  has_many :comment
end
