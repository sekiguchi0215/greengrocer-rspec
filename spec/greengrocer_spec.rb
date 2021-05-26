RSpec.describe Greengrocer do
  describe ".initialize" do
    context "インスタンスが生成されたとき" do
      let(:product_params) do
          [
            {name: "トマト", price: 100},
            {name: "きゅうり", price: 200}
          ]
      end
      let(:greengrocer) { Greengrocer.new(product_params) }
      let(:products) { greengrocer.products }
      it "@productsの要素の数が、product_paramsの要素の数と等しいこと" do
        expect(greengrocer.products.size).to eq 2
      end
      it "@productsの最初の要素の名前が、product_paramsの最初の要素の名前と等しいこと" do
        expect(greengrocer.products[0].name).to eq "トマト"
      end
      it "@productsの最初の要素の金額が、product_paramsの最初の要素の金額と等しいこと" do
        expect(greengrocer.products[0].price).to eq 100
      end
    end
  end

  describe ".register_product" do
    it "@productsの要素の数が、「product_paramsとadding_product_paramsの要素の数の和」と等しいこと" do
      product_params = [
        { name: "トマト", price: 100 },
        { name: "きゅうり", price: 200 }
      ]
      greengrocer = Greengrocer.new(product_params)
      adding_product_params = [
        { name: "ごぼう", price: 250 },
        { name: "れんこん", price: 350 }
      ]
      greengrocer.register_product(adding_product_params)
      expect(greengrocer.products.size).to eq 4
    end
    it "@productsの最後の要素の名前が、adding_product_paramsの最後の要素の名前と等しいこと" do
      product_params = [
        { name: "トマト", price: 100 },
        { name: "きゅうり", price: 200 }
      ]
      greengrocer = Greengrocer.new(product_params)
      adding_product_params = [
        { name: "ごぼう", price: 250 },
        { name: "れんこん", price: 350 }
      ]
      greengrocer.register_product(adding_product_params)
      expect(greengrocer.products[-1].name).to eq "れんこん"
    end
    it "@products最後の要素の金額が、adding_product_paramsの最後の要素の名前と等しいこと" do
      product_params = [
        { name: "トマト", price: 100 },
        { name: "きゅうり", price: 200 }
      ]
      greengrocer = Greengrocer.new(product_params)
      adding_product_params = [
        { name: "ごぼう", price: 250 },
        { name: "れんこん", price: 350 }
      ]
      greengrocer.register_product(adding_product_params)
      expect(greengrocer.products[-1].price).to eq 350
    end
  end
end