# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link do
    url "http://myurl.com"
    title "My Title"
  end
end
