FactoryBot.define do
    factory :product do
        title {"test"}
        sequence(:content) {|n| "TEST#{n}"}
        tech {"C言語"}
        sequence(:span) {|n| "#{n}"}
        image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/image.jpeg'))}
        github {"http://github.com"}
        link {"https://link.comz"}
        commitment {"最高"}
    end
end