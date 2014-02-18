10.times do
  category = Category.create(name: Faker::Lorem.sentence)
  5.times do
    category.posts << Post.create(title: Faker::Lorem.sentence,
     body: Faker::Lorem.sentence, edit_key: Faker::Lorem.characters(char_count = 6))
  end
end