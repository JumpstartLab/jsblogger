Fabricator(:comment) do
  author_name { Faker::Name.name }
  body { Faker::Lorem.paragraph }
  article_id { 1 }
end
