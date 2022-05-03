require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "#index" do
    it "正常にレスポンスを返すこと" do
      get products_path
      expect(response).to have_http_status :ok
      expect(response.body).to include "portfolio-land"
    end
  end
  describe "#product-index" do
    it "正常にレスポンスを返すことできる" do
      get products_path
      expect(response).to have_http_status :ok
      expect(response.body).to include "プロダクト一覧"
    end
  end
  describe "#user-product" do
    it "正常にレスポンスを返すこと" do
      get users_path
      expect(response).to have_http_status :ok
      expect(response.body).to include "プログラマー一覧"
    end
  end
  describe "ログインページ" do
    it "ログインページにレスポンスを返すことができる" do
      get new_user_session_path
      expect(response).to have_http_status :ok
      expect(response.body).to include "ログイン"
    end
  end
  describe "新規ページ" do
    it "新規ページに遷移できるのか?" do
      get new_user_registration_path
      expect(response).to have_http_status :ok
      expect(response.body).to include "新規登録画面"
    end
  end

  describe "編集ページ" do
    let!(:user){FactoryBot.create(:user)}
    let!(:product){FactoryBot.create(:product)}
    it "編集ページのタイトルが描画されているか" do
      get edit_product_path(product)
      expect(response.body).to include "プロダクト編集"
    end
  end
end
