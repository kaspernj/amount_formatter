require "spec_helper"

describe "i18n support for rails" do
  before do
    require "i18n"
    AmountFormatter.locale_engine = :i18n
  end

  after do
    AmountFormatter.locale_engine = nil
  end

  it "supports i18n" do
    I18n.config.backend.store_translations(:da, number: {format: {separator: ",", delimiter: "."}})

    I18n.with_locale :da do
      AmountFormatter.format(0.1).should eq "0,10"
    end
  end

  it "falls back when no separator set" do
    I18n.with_locale :se do
      AmountFormatter.format(0.1).should eq "0.10"
    end
  end
end
