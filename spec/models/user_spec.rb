require 'rails_helper'


describe User do
  describe '#create' do

   it "必須項目が入力してあれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "emailに@とドメインが存在する場合は登録できること" do
      user = create(:user)
      another_user = build(:user, email: "kkk@gmail.com")
      another_user.valid?
      expect(user).to be_valid
    end

    it "emailに@とドメインがない場合は登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: "kkkgmail")
      another_user.valid?
      expect(another_user.errors[:email]).to include("は不正な値です")
    end

    it "重複したemailが存在する場合は登録できない" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end
  
    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      # expect(user.errors[:password]).to include("を入力してください", "は7文字以上で入力してください", "は不正な値です")
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "passwordが7文字以上であれば登録できること" do
      user = build(:user, password: "password0", password_confirmation: "password0")
      user.valid?
      expect(user).to be_valid
    end

    it "passwordが6文字以下であれば登録できないこと" do
      user = build(:user, password: "passwo", password_confirmation: "password")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    it "familyname_kanjiがない場合は登録できないこと" do
      user = build(:user, familyname_kanji: nil)
      user.valid?
      expect(user.errors[:familyname_kanji]).to include("を入力してください")
    end

    it "familyname_kanjiが全角でない場合は登録できないこと" do
      another_user = build(:user, familyname_kanji: "ﾔﾏﾀﾞ")
      another_user.valid?
      expect(another_user.errors[:familyname_kanji]).to include("は不正な値です")
    end

    it "firstname_kanjiがない場合は登録できないこと" do
      user = build(:user, firstname_kanji: nil)
      user.valid?
      expect(user.errors[:firstname_kanji]).to include("を入力してください")
    end

    it "firstname_kanjiが全角でない場合は登録できないこと" do
      another_user = build(:user, firstname_kanji: "ﾀﾛｳ")
      another_user.valid?
      expect(another_user.errors[:firstname_kanji]).to include("は不正な値です")
    end

    it "familyname_kanaがない場合は登録できないこと" do
      user = build(:user, familyname_kana: nil)
      user.valid?
      expect(user.errors[:familyname_kana]).to include("を入力してください")
    end

    it "familyname_kanaが全角カナでない場合は登録できないこと" do
      another_user = build(:user, familyname_kana: "ﾔﾏﾀﾞ")
      another_user.valid?
      expect(another_user.errors[:familyname_kana]).to include("は不正な値です")
    end

    it "firstname_kanaがない場合は登録できないこと" do
      user = build(:user, firstname_kana: nil)
      user.valid?
      expect(user.errors[:firstname_kana]).to include("を入力してください")
    end

    it "firstname_kanaが全角カナでない場合は登録できないこと" do
      another_user = build(:user, firstname_kana: "ﾀﾛｳ")
      another_user.valid?
      expect(another_user.errors[:firstname_kana]).to include("は不正な値です")
    end

    it "birthdayがない場合は登録できないこと" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください")
    end

  end
end
