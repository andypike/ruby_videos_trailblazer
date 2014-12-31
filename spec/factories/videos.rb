FactoryGirl.define do
  factory :video do
    title        "A great ruby talk"
    original_url "http://youtube.com/12345"
    host         "you_tube"
    embed_url    "http://youtube.com/embed/12345"
    status       "published"
    originally_posted_on "2014-01-01"
    presenter
  end
end
