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


  describe "プロダクトの新規登録", type: :system do
    before do
      @product = FactoryBot.build(:product)
      @user = FactoryBot.build(:user)
    end
    describe "#create " do 
      let!(:user) {FactoryBot.create(:user)}
      let!(:product) {FactoryBot.create(:product)}
      it "投稿ページのタイトルが描画されていること" do
        sign_in(user)
        get new_product_path
        expect(response.body).to include "新規プロダクト作成"
      end
      context "無効な場合" do
        it "無効な値だと投稿されない" do
          sign_in(user)
          expect{
            post products_path, params:{product: {title: "", content: product.content, tech: "product",span: 1, image: "", github:"", link:"", commitment:"" }}
          }.to_not change(Product, :count)
        end
      end
      context "有効である場合" do
        let!(:product_params) {{product:{title: product.title, content:product.content, tech: product.tech, span: product.span, 
          image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/image.jpeg')),github: product.github, link: product.link,commitment: product.commitment}}}
        it "投稿数" do
          sign_in(user)
          expect{
            post products_path, params:product_params
          }.to change(Product, :count).by 1
        end
        it "フラッシュメッセージが表示されているか?" do
          post products_path, params:product_params
          expect(flash).to be_any
        end

      end
    end
  end
end
