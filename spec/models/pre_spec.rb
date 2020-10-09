require 'rails_helper'

RSpec.describe Pre, type: :model do
 describe '#create' do
  before do
    @pre = FactoryBot.build(:pre)
  end

  it "全て入力できていれば保存ができること" do
    expect(@pre).to be_valid
  end

  it "house_codeが空では登録できないこと" do
    @pre.house_code = nil
    @pre.valid?
    expect(@pre.errors.full_messages).to include("House code can't be blank")
  end

  it "house_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと" do
    @pre.house_code = '1234567'
    @pre.valid?
    expect(@pre.errors.full_messages).to include("House code code is invalid. Include hyphen(-)")
  end

  it "cityが空では登録できないこと" do
    @pre.city = nil
    @pre.valid?
    expect(@pre.errors.full_messages).to include("City can't be blank")
  end

  it "cityが空では登録できないこと" do
    @pre.city = nil
    @pre.valid?
    expect(@pre.errors.full_messages).to include("City can't be blank")
  end

  it "prefecture_idが1では登録できないこと" do
    @pre.prefecture_id = "1"
    @pre.valid?
    expect(@pre.errors.full_messages).to include("Prefecture must be other than 1")
  end

  it "house_addressが空では登録できないこと" do
    @pre.house_address = nil
    @pre.valid?
    expect(@pre.errors.full_messages).to include("House address can't be blank")
  end

  it "telephoneが空では登録できないこと" do
    @pre.telephone = nil
    @pre.valid?
    expect(@pre.errors.full_messages).to include("Telephone can't be blank")
  end

  it "telephoneが40文字以上では登録できないこと" do
    @pre.telephone = "0000000000000"
    @pre.valid?
    expect(@pre.errors.full_messages).to include("Telephone is too long (maximum is 11 characters)")
  end

  it "tokenが空では登録できないこと" do
    @pre.token = nil
    @pre.valid?
    expect(@pre.errors.full_messages).to include("Token can't be blank")
  end
 end
end
