require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it "全部が存在すれば登録できること" do
      expect(@item).to be_valid
    end

    it "nameが空では登録できないこと" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "explainが空では登録できないこと" do
      @item.explain = nil
      @item.valid?

      expect(@item.errors.full_messages).to include("Explain can't be blank")
    end

    it "priceが空では登録できないこと" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid")
    end

    it "priceが文字では登録できないこと" do
      @item.price = "abc"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it "priceが300では登録できないこと" do
      @item.price = "300"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 300")
    end

    it "category_idが1では登録できないこと" do
      @item.category_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it "fee_idが1では登録できないこと" do
      @item.fee_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Fee must be other than 1")
    end

    it "prefecture_idが1では登録できないこと" do
      @item.prefecture_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it "shipment_idが1では登録できないこと" do
      @item.shipment_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipment must be other than 1")
    end

    it "Status_idが1では登録できないこと" do
      @item.status_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end

  end
end
