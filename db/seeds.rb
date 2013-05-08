# insert the root item manually, which is the init of the categories tree
connection = ActiveRecord::Base.connection();
connection.execute('INSERT INTO "categories" ("category_id", "left", "name", "right", "created_at", "updated_at") VALUES (NULL, 1, "ROOT", 2, "2013-05-07 14:23:46", "2013-05-07 14:23:46")')
# create example categories
root = Category.find_by_name("ROOT")
root_categories = Category.create([{ name: 'CONSUMABLES', category_id: root.id }, { name: 'ELECTRONICS', category_id: root.id }, { name: 'BOOKS', category_id: root.id} ])
consumables = Category.create([{ name: 'SWEETS', :category_id => root_categories.first.id }, { name: 'DRINKS', :category_id => root_categories.first.id }, { name: 'CHEESE', :category_id => root_categories.first.id }])
drinks = Category.create([{ name: 'SOFTDRINKS', :category_id => consumables[1].id }, { name: 'BEER', :category_id => consumables[1].id }])
# create example products
products = Product.create([{ name: 'Haribo Goldbaeren', category_id: consumables.first.id }, { name: 'Excuisa Light', category_id: consumables.last.id }, { name: 'Becks Lime', category_id: drinks.last.id }, { name: 'Milk Nuss', category_id: consumables.first.id }])
