FactoryGirl.define do
  factory :user do
    nickname  "andypike"
    name      "Andy Pike"
    image_url "http://somewhere.com/andy.jpg"
    provider  "github"
    uid       "12345"
  end
end
