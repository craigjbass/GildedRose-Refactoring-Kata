require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "can change sell in to -1" do
      items = [GildedRose::Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq(-1)
    end

    it "??" do
      items = [GildedRose::Item.new("foo", 1, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq('foo')
      expect(items[0].sell_in).to eq(0)
      expect(items[0].quality).to eq(0)
    end

    it "??" do
      items = [GildedRose::Item.new("foo", 0, 1)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq(-1)
      expect(items[0].quality).to eq(0)
    end
  end
end
