require 'rails_helper'

RSpec.describe SpellChecker do
  it "accepts a known word" do
    expect(described_class.new.check("տուն")).to be true
  end

  it "flags a known dictionary gap" do
    expect(described_class.new.check("զինուժը")).to be false
  end
end