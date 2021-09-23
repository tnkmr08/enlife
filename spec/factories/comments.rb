FactoryBot.define do
  factory :comment do
    comment_text            { 'good' }
    
    association :user
    association :post
  end
end