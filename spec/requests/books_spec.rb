require 'rails_helper'

RSpec.describe 'Books', type: :request do
  let!(:user) { create(:user) }
  let!(:books) { create_list(:book, 3, user: user) }

  describe 'GET /books' do
    it '200ステータスが返ってくる' do
      get books_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /books' do
    context 'ログインしている場合' do
      before do
        sign_in user
      end

      it '記事が保存される' do
        book_params = attributes_for(:book)
        post books_path({book: book_params})
        expect(response).to have_http_status(302)
        expect(Book.last.title).to eq(book_params[:title])
        expect(Book.last.content.body.to_plain_text).to eq(book_params[:content])
      end
    end

    context 'ログインしていない場合' do
      it 'ログイン画面に遷移する' do
        book_params = attributes_for(:book)
        post books_path({book: book_params})
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end