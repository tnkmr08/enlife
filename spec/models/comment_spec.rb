require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿' do
    it 'comment_textがあればコメントできる' do
      expect(@comment).to be_valid
    end

    it 'comment_textが空だとコメントできない' do
      @comment.comment_text = ''
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Comment text can't be blank")
    end 
  end
end
