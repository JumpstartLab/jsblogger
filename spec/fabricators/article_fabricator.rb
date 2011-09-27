Fabricator(:article) do
  title { Faker::Lorem.sentence + sequence(:title, 999).to_s }
  body { Faker::Lorem.paragraphs(3).join("\n") }
end

Fabricator(:article_with_comments, :from => :article) do
  comments!(:count => 3){ |article, index| Fabricate(:comment, :article => article) }  
end

Fabricator(:article_without_comments, :from => :article_with_comments ) do
  comments { [] }
end
