# frozen_string_literal: true

categories = [
  { name: 'Web Design' },
  { name: 'JavaScript' },
  { name: 'JQuery' },
  { name: 'CSS' },
]

Category.create!(categories)

tags = [
  { name: 'Chrome' },
  { name: 'CSS' },
  { name: 'Tutorial' },
  { name: 'Backend' },
  { name: 'JQuery' },
  { name: 'Design' },
  { name: 'Development' },
  { name: 'JavaScript' },
  { name: 'Website' },
]

Tag.create!(tags)

Post.create!(title: 'Test post', body: 'test', category_id: Category.first.id, tag_ids: Tag.ids.sample(4))
Post.create!(title: 'Test post 2', body: 'test 2', category_id: Category.last.id, tag_ids: Tag.ids.sample(4))

User.create!(
  email: 'test@user.com',
  password: 'test@user.com1',
  first_name: FFaker::Name.first_name,
  last_name: FFaker::Name.last_name,
  username: FFaker::Internet.user_name,
  birthday: 18.years.from_now,
)