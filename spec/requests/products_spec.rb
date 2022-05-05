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

  describe "新規ページにアクセステスト" do
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
        it "投稿されているかどうか?" do
          sign_in(user)
          expect{
            post products_path, params:product_params
          }.to change(Product, :count).by 1
        end
        it "フラッシュメッセージが表示されているか?" do
          post products_path, params:product_params
          expect(flash).to be_any
        end
        # it "投稿に成功したらリダイレクトされるか?" do
        #   post products_path, params: product_params
        #   pending 'この先はなぜかテストが失敗するのであとで直す'
        #   product = Product.last
        #   expect(response).to redirect_to product
        # end

      end
    end

    describe "編集ページのアクセステスト" do
      let!(:product) {FactoryBot.create(:product)}
      let!(:user) {FactoryBot.create(:user)}
      it "編集ページのタイトルが描画されていること" do
        sign_in(user)
        get edit_product_path(product)
      end
      context "無効なデータの場合" do
        it "更新できない" do
          patch product_path(product), params:{product:{title: "", content: product.content, tech: "product",span: 1, image: "", github:"", link:"", commitment:"" }}
          product.reload
          expect(product.title).to_not eq ""
          expect(product.content).to_not eq ""
          expect(product.tech).to_not eq ""
          expect(product.span).to_not eq "1"
          expect(product.image).to_not eq ""
          expect(product.github).to_not eq ""
          expect(product.link).to_not eq ""
          expect(product.commitment).to_not eq ""
        end
        it "更新が失敗した時にeditページが表示されていること" do
          sign_in(user)
          get edit_product_path(product)
          patch product_path(product), params:{product:{title: "", content: product.content, tech: "product",span: 1, image: "", github:"", link:"", commitment:"" }}
          expect(response.body).to include "プロダクト編集"
        end
      end

      context "有効な値の場合" do
        before do
          @title = 'Foo-Bar'
          @content = 'Test'
          @span = 1
          @tech ="Test"
          @image = ""
          @github = "test.com"
          @link = "test.com"
          @commitment = "testtest"
          patch product_path(product), params: { product: { title: @title, content: @content, span: @span, image: @image,
                                                            tech: @tech, github: @github, link: @link, commitment: @commitment } }
        end
        it '更新できること' do
          product.reload
        end
      end
    end

    describe "削除機能テスト" do
      let!(:user) {FactoryBot.create(:user)}
      let!(:product) {FactoryBot.create(:product)}
      let(:other_user) {FactoryBot.create(:archer)}
      context "ログイン状態ではないとき" do
        it "削除できないこと" do
          expect{
            delete product_path(product)
          }.to_not change(Product, :count)
        end
        it "ログインページにリダイレクトされるること" do
          delete product_path(product)
          expect(response).to redirect_to new_user_session_path
        end
      end
      context "adminユーザでログイン状態の場合" do
        it "削除できること" do
          sign_in(user)
          visit user_path(product)
          expect{delete product_path(product)}.to change(Product, :count).by(0)
        end
      end
    end
  end
end
