FactoryGirl.define do
  factory :order do
    user
    total { rand() * 100 }
  end
end
