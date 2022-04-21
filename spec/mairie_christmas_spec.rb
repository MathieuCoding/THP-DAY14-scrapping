require_relative '../lib/mairie_christmas'

describe "The get_townhall_email method" do
    it "should return the right email address" do
      expect(get_townhall_email).not_to be_nil
    end
end

describe "The get_townhall_urls method" do
    it "should return urls" do
        expect(get_townhall_urls).not_to be_nil
    end
end

describe "The get_townhall_names method" do
    it "should return city names" do
        expect(get_townhall_names).not_to be_nil
    end
end