require_relative '../lib/lexiconomitron.rb'

describe Lexiconomitron do

  before :each do
    @lexi = Lexiconomitron.new
  end

  describe "#eat_t" do
    it "removes every letter t from the input" do
      expect(@lexi.eat_t("great scott!")).to eq("grea sco!")
    end
  end

  describe "#do_shazam" do
    it "reverses letters within the words" do
      expect(@lexi.do_shazam("This is a boring test")).to eq(["sih", "se"])
    end
  end

  describe "#oompa_loompa" do
    it "put words length 3 or less in the same order" do
      expect(@lexi.oompa_loompa("if you wanna be my lover")).to eq(["if", "you", "be", "my"])
    end
  end

end
