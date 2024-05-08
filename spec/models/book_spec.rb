require 'rails_helper'

RSpec.describe Book, type: :model do
  let!(:user) { create(:user) }

  context 'タイトルと内容が入力されている場合' do
    let!(:book) { build(:book, user: user)}

    it '記事を保存できる' do
      expect(book).to be_valid
    end
  end

  context 'タイトルの文字が一文字の場合' do
    let!(:book) { build(:book, title: Faker::Lorem.characters(number: 1), user: user) }

    before do
      book.save
    end

    it '記事を保存できない' do
      expect(book.errors.messages[:title][0]).to eq('は2文字以上で入力してください')
    end
  end
end
