require 'rails_helper'

describe Address do
  describe '#create' do
    context '登録が有効' do
      it '住所情報が全て入力済なら有効' do
        address = build(:address)
        expect(address).to be_valid
      end
    end

    context '登録が無効' do  #ビル名、電話番号は任意
      context '各項目が空欄なら無効' do
        it "family_nameがない場合は登録できないこと" do
          address = build(:address, family_name: nil)
          address.valid?
          expect(address.errors[:family_name]).to include("を入力してください")
        end
    
        it "family_nameが全角でない場合は登録できないこと" do
          another_address = build(:address, family_name: "ﾔﾏﾀﾞ")
          another_address.valid?
          expect(another_address.errors[:family_name]).to include("は不正な値です")
        end
    
        it "given_nameがない場合は登録できないこと" do
          address = build(:address, given_name: nil)
          address.valid?
          expect(address.errors[:given_name]).to include("を入力してください")
        end
    
        it "given_nameが全角でない場合は登録できないこと" do
          another_address = build(:address, given_name: "ﾀﾛｳ")
          another_address.valid?
          expect(another_address.errors[:given_name]).to include("は不正な値です")
        end
    
        it "family_name_kanaがない場合は登録できないこと" do
          address = build(:address, family_name_kana: nil)
          address.valid?
          expect(address.errors[:family_name_kana]).to include("を入力してください")
        end
    
        it "family_name_kanaが全角カナでない場合は登録できないこと" do
          another_address = build(:address, family_name_kana: "ﾔﾏﾀﾞ")
          another_address.valid?
          expect(another_address.errors[:family_name_kana]).to include("は不正な値です")
        end
    
        it "given_name_kanaがない場合は登録できないこと" do
          address = build(:address, given_name_kana: nil)
          address.valid?
          expect(address.errors[:given_name_kana]).to include("を入力してください")
        end
    
        it "given_name_kanaが全角カナでない場合は登録できないこと" do
          another_address = build(:address, given_name_kana: "ﾀﾛｳ")
          another_address.valid?
          expect(another_address.errors[:given_name_kana]).to include("は不正な値です")
        end
        it '郵便番号がない場合は登録できないこと' do
          address = build(:address, postcode: nil)
          address.valid?
          expect(address.errors[:postcode]).to include("を入力してください")
        end

        it '都道府県がない場合は登録できないこと' do
          address = build(:address, prefecture: nil)
          address.valid?
          expect(address.errors[:prefecture]).to include("を入力してください")
        end

        it '市区町村がない場合は登録できないこと' do
          address = build(:address, city: nil)
          address.valid?
          expect(address.errors[:city]).to include("を入力してください")
        end

        it '番地がない場合は登録できないこと' do
          address = build(:address, block: nil)
          address.valid?
          expect(address.errors[:block]).to include("を入力してください")
        end
      end
    end
  end
end