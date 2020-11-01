require 'rails_helper'

RSpec.describe :user, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'user created successfully' do
    it 'can be valid all' do
      expect(@user).to be_valid
    end
  end

  context 'user failed' do
    it 'cannot be valid nickname' do
      @user.nickname = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'cannot be valid password' do
      @user.password = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'cannot be matched password_confirmation' do
      @user.password_confirmation = 'hiroki'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'cannot be valid email' do
      @user.email = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'cannot be valid first_name' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", 'First name is invalid')
    end

    it 'cannot be valid last_name' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name is invalid')
    end

    it 'cannot be valid first_name_kana' do
      @user.first_name_kana = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'cannot be valid last_name_kana' do
      @user.last_name_kana = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'cannot be valid birthday' do
      @user.birthday = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it 'emailは一意であること' do
      first_user = FactoryBot.create(:user)
      second_user = FactoryBot.build(:user)
      second_user.valid?
      expect(second_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'passwordは5文字以下だと登録できない' do
      @user.password = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordは英語だけだったら登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordは数字だけだったら登録できない' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'first_nameは、全角漢字・平仮名・カタカナ以外は登録できない' do
      @user.first_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end

    it 'last_nameは、全角漢字・平仮名・カタカナ以外は登録できない' do
      @user.last_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end

    it 'first_name_kanaは、カタカナ以外は登録できない' do
      @user.first_name_kana = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end

    it 'last_name_kanaは、カタカナ以外は登録できない' do
      @user.last_name_kana = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end
  end
end
