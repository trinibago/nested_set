# TODO: tests, refactoring foo bartender is 
class Product < ActiveRecord::Base
  attr_accessible :category_id, :name
  validates_presence_of :category_id, :name
  
  def self.count_nested *categories
    query = joins("INNER JOIN categories c, categories p ON c.id = products.category_id")
    query = query.group('products.id')
    query = query.where('p.name IN (:categories) AND c.left BETWEEN p.left AND p.right', 
                        { categories: categories.flatten })
    query.length
  end
end
