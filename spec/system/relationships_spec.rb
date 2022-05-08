require 'rails_helper'

RSpec.describe 'Relationships', type: :system do
    before do
        @user1 = FactoryBot.create(:user)
        @user2 = FactoryBot.create(:user)
    end
    describe '#create, #destroy' do
        it 'ユーザーフォロー,フォロー解除できる' do
            sign_in(@user1)
            visit users_path(@user1)
            click_on 'フォローする'
            expect(page).to have_button 'フォロー済み'
            expect(@user1.followings.count).to eq(1)
            expect(@user2.followers.count).to eq(1)
            click_on 'フォロー済み'
            expect(page).to have_button 'フォローする'
            expect(@user1.followers.count).to eq(0)
            expect(@user2.followings.count).to eq(0)
        end
    end
end
