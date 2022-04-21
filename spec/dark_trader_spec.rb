require_relative '../lib/dark_trader'

describe "The crypto_names method" do
    it "should return an array, and array is not nil" do
      expect(crypto_names).not_to be_nil
    end
  end
  
  describe "the price method" do
    it "should return an array, and array is not nil" do
      expect(crypto_values).not_to be_nil
    end
  end