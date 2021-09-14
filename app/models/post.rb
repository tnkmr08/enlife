class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  with_options presence: true do
    validates :text
    validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :image
  end
end
