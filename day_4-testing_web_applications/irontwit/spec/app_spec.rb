# spec/app_spec.rb
require File.expand_path '../spec_helper.rb', __FILE__

describe "The Irontwit" do
  before(:each) do
    get ("/")
  end
  context "register" do
    let(:user) {User.new("yo", "123")}

    it "include a user to DB" do
      size = @@users.size
      post "/register"
      expect(@@users.size).to eq(size + 1)
    end

    it ""
  end
end
