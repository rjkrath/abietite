FactoryGirl.define do
  factory :daily_offer do
    sequence(:title) { |n| "Offer ##{n}" }
    image_path 'path://to/image'
    offer_link 'link://to/offer'
    price '$12.00'

    author
  end
end
