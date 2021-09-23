require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '新規投稿' do
    context '投稿できる' do
      it 'category_id, place_name, image, textが存在すれば保存できる' do
        expect(@post).to be_valid
      end
    end

    context '投稿できない' do
      it 'category_idが空では保存できない' do
        @post.category_id = 1
        @post.valid?
        expect(@post.errors.full_messages).to include("Category can't be blank")
      end

      it 'place_nameが空では保存できない' do
        @post.place_name = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Place name can't be blank")
      end

      it 'imageが空では保存できない' do
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Image can't be blank")
      end

      it 'textが空では保存できない' do
        @post.text = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Text can't be blank")
      end

      it 'userが紐付いていないと保存できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('User must exist')
      end

    end


  end  
end
