require 'rails_helper'

RSpec.describe 'Book', type: :system do
  let!(:user) { create(:user) }
  let!(:books) { create_list(:book, 3, user: user) }

  it '記事一覧が表示される' do
    visit root_path
    books.each do |book|
      expect(page).to have_css('.card_title', text: book.title)
    end
  end

  it '詳細記事を表示できる' do
    visit root_path

    book = books.first
    click_on book.title

    expect(page).to have_css('.article_title', text: book.title)
    expect(page).to have_css('.article_content', text: book.content.to_plain_text)
  end
end