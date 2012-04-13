# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do


  factory :link do
    sequence(:url) {|n| "http://myurl#{n}.com"}
    title "My Title"

    factory :link_with_5_votes do |link|
      link.after_create do |link|
        5.times {Factory(:vote, :link => link)}
      end
    end
    factory :link_with_10_votes do |link|
      link.after_create do |link|
        10.times {Factory(:vote, :link => link)}
      end
    end
    factory :link_with_8_votes do |link|
      link.after_create do |link|
        10.times {Factory(:vote, :link => link)}
      end
    end

  end
end
