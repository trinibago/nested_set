# TODO: tests, refactoring test1
class Category < ActiveRecord::Base
  attr_accessible :category_id, :name
  belongs_to :category
  validates_presence_of :category_id, :name
  validates_uniqueness_of :name
  before_create :update_nested_set
  before_destroy { |record| not record.root? }

  def root?
    category_id.blank?
  end

private
  def update_nested_set
    parent_right = category.right
    self.left = parent_right
    self.right = parent_right + 1
    self.class.where('right >= ?', parent_right).update_all('right = right + 2')
    self.class.where('left > ?', parent_right).update_all('left = left + 2')
  end
end
