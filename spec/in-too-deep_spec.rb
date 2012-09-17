require_relative '../in-too-deep'

describe "InTooDeep" do
  subject { InTooDeep.new }

  it "should allow setting deep" do
    subject[:made][:up][:key] = :blah
    subject[:made][:up][:key].should == :blah
    subject[:made][:up][:key2].should be_a InTooDeep
  end

  it "should read unset values as nil after freezing" do
    subject[:made][:up][:key] = :blah
    subject.freeze!
    subject[:made][:up][:key].should == :blah
    subject[:made][:up][:key2].should be_nil
  end

  it "should treat symbols and strings equally" do
    subject[:sym]['str'][:one] = :blah
    subject.freeze!
    subject['sym'][:str]['one'].should == :blah
  end
end
