class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '飲食店'},
    { id: 3, name: 'ショップ'},
    { id: 4, name: 'スポット'}
  ]
  
  include ActiveHash::Associations
  has_many :posts
end