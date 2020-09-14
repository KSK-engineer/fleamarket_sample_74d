require 'rails_helper'
describe Transaction do
  describe 'Transactionモデルの単体テスト' do
    before { create(:user)
             create(:card) 
             create(:category)
             create(:item)
            }
    
    context '登録成功パターン' do

      example "item_id、card_id、buyer_id(user_id)があれば登録できる" do
        transaction = build(:transaction)
        
        transaction.valid?
        expect(transaction).to be_valid
      end

    end

    context '登録失敗パターン' do

      example "item_idが空の場合、登録できない" do
        transaction = build(:transaction, item_id: nil)
        transaction.valid?
        expect(transaction.errors[:item_id]).to include("を入力してください")
      end

      example "card_idが空の場合、登録できない" do
        transaction = build(:transaction, card_id: nil)
        transaction.valid?
        expect(transaction.errors[:card_id]).to include("を入力してください")
      end

      example "buyer_id(user_id)が空の場合、登録できない" do
        transaction = build(:transaction, buyer_id: nil)
        transaction.valid?
        expect(transaction.errors[:buyer_id]).to include("を入力してください")
      end

      example "取引状況が空の場合、登録できない" do
        transaction = build(:transaction, status: nil)
        transaction.valid?
        expect(transaction.errors[:status]).to include("を入力してください")
      end

    end
  end
end