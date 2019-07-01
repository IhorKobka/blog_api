# frozen_string_literal: true

categories = [
  { name: 'Web Design' },
  { name: 'JavaScript' },
  { name: 'JQuery' },
  { name: 'CSS' },
]

Category.create!(categories)

Post.create!(title: 'Test post', body: 'test', category_id: Category.first.id)