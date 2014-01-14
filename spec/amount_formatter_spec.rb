require_relative "spec_helper"

describe AmountFormatter do
  it "formats numbers" do
    AmountFormatter.format(12345.12, :precision => 2, :seperator => ",", :delimiter => ".").should eq "12.345,12"
    AmountFormatter.format(12345.12).should eq "12,345.12"
  end
end
