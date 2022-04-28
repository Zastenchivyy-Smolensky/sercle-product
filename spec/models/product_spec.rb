RSpec.describe Product, type: :model do
    it "プロダクトの一覧ページを表示"
    product = Product.new(
        title:"test",
        content: "test",
        image_id: "test",
        span: 1,
        commitment:"test",
        github: "http://github.com",
        link: "http://github.com"
    )
    expect(product.title).to eq "test"
end