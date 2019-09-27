require 'gilded_rose'

describe GildedRose do
  describe "#update_quality" do
    TIX = "Backstage passes to a TAFKAL80ETC concert"
    SULF = "Sulfuras, Hand of Ragnaros"
    BRIE = "Aged Brie"
    UNDEFINED_ITEM = "foo"
    [
      [UNDEFINED_ITEM, 0, 0, -1, 0],
      [UNDEFINED_ITEM, 1, 0, 0, 0],
      [UNDEFINED_ITEM, 0, 1, -1, 0],
      [BRIE, 0, 1, -1, 3],
      [BRIE, 0, 51, -1, 51],
      [BRIE, 0, 50, -1, 50],
      [BRIE, -1, 48, -2, 50],
      [TIX, 0, 1, -1, 0],
      [TIX, 12, 1, 11, 2],
      [TIX, 10, 1, 9, 3],
      [TIX, 10, 10_000_000, 9, 10_000_000],
      [TIX, 5, -10_000_000, 4, -9_999_997],
      [SULF, 5, -123, 5, -123],
      [SULF, -3, -123, -3, -123],
      [SULF, -2, 123, -2, 123],
      [UNDEFINED_ITEM, -5, -123, -6, -123],
      [UNDEFINED_ITEM, -2, 123, -3, 121],
      [UNDEFINED_ITEM, -2, 2, -3, 0],
      [UNDEFINED_ITEM, 1, 2, 0, 1], # latest
    ].each do |name, sell_in, quality, expected_sell_in, expected_quality|
      it "#{name} #{sell_in} #{quality}" do
        items = [GildedRose::Item.new(name, sell_in, quality)]

        GildedRose.new(items).update_quality()
        expect(items[0].name).to eq(name)
        expect(items[0].sell_in).to eq(expected_sell_in)
        expect(items[0].quality).to eq(expected_quality)

        expect(items[0].to_s).to eq("#{name}, #{expected_sell_in}, #{expected_quality}")
      end
    end
  end
end
