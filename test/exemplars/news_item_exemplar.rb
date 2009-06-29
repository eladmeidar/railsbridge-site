class NewsItem < ActiveRecord::Base
  generator_for :headline => "The Headline"
  generator_for :lede => "The Lede"
  generator_for :body => "The Body"
end
