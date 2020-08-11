require 'rails_helper'
describe User do
  describe '#create' do
    it "全ての値が適切に入力されている場合、登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "emailが空の場合、登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "emailの中間に@がない場合、登録できないこと" do
      user = build(:user, email: "email")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "emailが登録済みの場合、登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "passwordが空の場合、登録できないこと" do
      user = build(:user, password: "", password_confirmation: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "passwordが6文字以下の場合、登録できないこと" do
      user = build(:user, password: "12345q", password_confirmation: "12345q")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください", "は英字と数字両方を含むパスワードを設定してください")
    end

    it "passwordが129文字以上の場合、登録できないこと" do
      o = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map(&:to_a).flatten
      password = (0...129).map { o[rand(o.length)] }.join
      user = build(:user, password: password.to_s, password_confirmation: password.to_s)
      user.valid?
      expect(user.errors[:password]).to include("は128文字以内で入力してください")
    end

    it "passwordが数字のみの場合、登録できないこと" do
      user = build(:user, password: "1234567", password_confirmation: "1234567")
      user.valid?
      expect(user.errors[:password]).to include("は英字と数字両方を含むパスワードを設定してください")
    end

    it "passwordが英字のみの場合、登録できないこと" do
      user = build(:user, password: "abcdefg", password_confirmation: "abcdefg")
      user.valid?
      expect(user.errors[:password]).to include("は英字と数字両方を含むパスワードを設定してください")
    end

    it "passwordが数字と英字を含む7文字の場合、登録できること" do
      user = build(:user, password: "1a2b3c4", password_confirmation: "1a2b3c4")
      expect(user).to be_valid
    end
    it "passwordが数字と英字を含む128文字の場合、登録できること" do
      o = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map(&:to_a).flatten
      password = (0...128).map { o[rand(o.length)] }.join
      user = build(:user, password: password.to_s, password_confirmation: password.to_s)
      expect(user).to be_valid
    end

    it "nicknameが空の場合、登録できないこと" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "nicknameが21文字以上の場合、登録できないこと" do
      nickname = (0...21).map { ('A'..'Z').to_a[rand(26)] }.join # 英字で21文字の文字列を生成
      user = build(:user, nickname: nickname.to_s)
      user.valid?
      expect(user.errors[:nickname]).to include("は20文字以内で入力してください")
    end

    it "nicknameが20文字以内の場合、登録できること" do
      nickname = (0...20).map { ('A'..'Z').to_a[rand(26)] }.join # 英字で20文字の文字列を生成
      user = build(:user, nickname: nickname.to_s)
      expect(user).to be_valid
    end

    it "family_nameが空の場合、登録できないこと" do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください")
    end
    
    it "family_nameが36文字以上の場合、登録できないこと" do
      family_name = (0...36).map { ('A'..'Z').to_a[rand(26)] }.join # 英字で36文字の文字列を生成
      user = build(:user, family_name: family_name.to_s)
      user.valid?
      expect(user.errors[:family_name]).to include("は35文字以内で入力してください")
    end

    it "family_nameが特殊文字を含む場合、登録できないこと" do
      user = build(:user, family_name: "@＠!！_?><")
      user.valid?
      expect(user.errors[:family_name]).to include("は不正な値です")
    end

    it "faily_nameが数字を含む場合、登録できないこと" do
      user = build(:user, family_name: "123１２３")
      user.valid?
      expect(user.errors[:family_name]).to include("は不正な値です")
    end

    it "family_nameが数字や特殊文字を含まず35文字以内の場合、登録できること" do
      family_name = (0...35).map { ('A'..'Z').to_a[rand(26)] }.join # 英字で35文字の文字列を生成
      user = build(:user, family_name: family_name.to_s)
      expect(user).to be_valid
    end

    it "first_nameが空の場合、登録できないこと" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end
    it "first_nameが36文字以上の場合、登録できないこと" do
      first_name = (0...36).map { ('A'..'Z').to_a[rand(26)] }.join # 英字で36文字の文字列を生成
      user = build(:user, first_name: first_name.to_s)
      user.valid?
      expect(user.errors[:first_name]).to include("は35文字以内で入力してください")
    end

    it "first_nameが特殊文字を含む場合、登録できないこと" do
      user = build(:user, first_name: "@＠!！_?><")
      user.valid?
      expect(user.errors[:first_name]).to include("は不正な値です")
    end

    it "first_nameが数字を含む場合、登録できないこと" do
      user = build(:user, first_name: "123１２３")
      user.valid?
      expect(user.errors[:first_name]).to include("は不正な値です")
    end

    it "first_nameが数字や特殊文字を含まず35文字以内の場合、登録できること" do
      first_name = (0...35).map { ('A'..'Z').to_a[rand(26)] }.join # 英字で35文字の文字列を生成
      user = build(:user, first_name: first_name.to_s)
      expect(user).to be_valid
    end

    it "family_name_kanaが空の場合、登録できないこと" do
      user = build(:user, family_name_kana: "")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("を入力してください")
    end
    it "family_name_kanaが36文字以上の場合、登録できないこと" do
      family_name_kana = ('ア'..'ン').to_a.sample(36).join # カタカナで36文字の文字列を生成
      user = build(:user, family_name_kana: family_name_kana.to_s)
      user.valid?
      expect(user.errors[:family_name_kana]).to include("は35文字以内で入力してください")
    end

    it "family_name_kanaが特殊文字を含む場合、登録できないこと" do
      user = build(:user, family_name_kana: "@＠!！_?><")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("は不正な値です")
    end

    it "family_name_kanaが数字を含む場合、登録できないこと" do
      user = build(:user, family_name_kana: "123１２３")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("は不正な値です")
    end

    it "family_name_kanaがカタカナのみで35文字以内の場合、登録できること" do
      family_name_kana = ('ア'..'ン').to_a.sample(35).join # カタカナで35文字の文字列を生成
      user = build(:user, family_name_kana: family_name_kana.to_s)
      expect(user).to be_valid
    end

    it "first_name_kanaが空の場合、登録できないこと" do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end
    it "first_name_kanaが36文字以上の場合、登録できないこと" do
      first_name_kana = ('ア'..'ン').to_a.sample(36).join # カタカナで36文字の文字列を生成
      user = build(:user, first_name_kana: first_name_kana.to_s)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は35文字以内で入力してください")
    end

    it "first_name_kanaが特殊文字を含む場合、登録できないこと" do
      user = build(:user, first_name_kana: "@＠!！_?><")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は不正な値です")
    end

    it "first_name_kanaが数字を含む場合、登録できないこと" do
      user = build(:user, first_name_kana: "123１２３")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は不正な値です")
    end

    it "first_name_kanaがカタカナのみで35文字以内の場合、登録できること" do
      first_name_kana = ('ア'..'ン').to_a.sample(35).join # カタカナで35文字の文字列を生成
      user = build(:user, first_name_kana: first_name_kana.to_s)
      expect(user).to be_valid
    end

    it "birth_yearが空の場合、登録できないこと" do
      user = build(:user, birth_year: nil)
      user.valid?
      expect(user.errors[:birth_year]).to include("を入力してください")
    end
    it "birth_monthが空の場合、登録できないこと" do
      user = build(:user, birth_month: nil)
      user.valid?
      expect(user.errors[:birth_month]).to include("を入力してください")
    end

    it "birth_dayが空の場合、登録できないこと" do
      user = build(:user, birth_day: nil)
      user.valid?
      expect(user.errors[:birth_day]).to include("を入力してください")
    end
  end
end