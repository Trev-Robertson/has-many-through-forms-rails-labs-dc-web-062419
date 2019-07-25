class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories
  accepts_nested_attributes_for :comments
  accepts_nested_attributes_for :users
  def categories_attributes=(category_name)
   a = category_name["0"][:name]
   Category.find_or_create_by(name: a)

  end




end
