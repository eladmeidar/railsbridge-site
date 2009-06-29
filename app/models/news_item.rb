class NewsItem < ActiveRecord::Base
  
  attr_accessible :headline, :lede, :body
  
end
