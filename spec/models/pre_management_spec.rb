require 'rails_helper'

RSpec.describe PreManagement, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item)
      @pre_management = FactoryBot.build(:pre_management, user_id: @user.id, item_id: @item.id)
    end
  
    it "全て入力できていれば保存ができること" do
      expect(@pre_management).to be_valid
    end
  
    it "house_codeが空では登録できないこと" do
      @pre_management.house_code = nil
      @pre_management.valid?
      expect(@pre_management.errors.full_messages).to include("House code can't be blank")
    end

    it "house_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと" do
      @pre_management.house_code = '1234567'
      @pre_management.valid?
      expect(@pre_management.errors.full_messages).to include("House code is invalid. Include hyphen(-)")
    end
  
    it "cityが空では登録できないこと" do
      @pre_management.city = nil
      @pre_management.valid?
      expect(@pre_management.errors.full_messages).to include("City can't be blank")
    end
  
    it "prefecture_idが1では登録できないこと" do
      @pre_management.prefecture_id = "1"
      @pre_management.valid?
      expect(@pre_management.errors.full_messages).to include("Prefecture must be other than 1")
    end
  
    it "house_addressが空では登録できないこと" do
      @pre_management.house_address = nil
      @pre_management.valid?
      expect(@pre_management.errors.full_messages).to include("House address can't be blank")
    end
  
    it "telephoneが空では登録できないこと" do
      @pre_management.telephone = nil
      @pre_management.valid?
      expect(@pre_management.errors.full_messages).to include("Telephone can't be blank")
    end
  
    it "telephoneが11文字以上では登録できないこと" do
      @pre_management.telephone = "0000000000000"
      @pre_management.valid?
      expect(@pre_management.errors.full_messages).to include("Telephone is too long (maximum is 11 characters)")
    end
  
    it "tokenが空では登録できないこと" do
      @pre_management.token = nil
      @pre_management.valid?
      expect(@pre_management.errors.full_messages).to include("Token can't be blank")
    end
   end
end
