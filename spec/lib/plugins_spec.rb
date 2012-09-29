require 'spec_helper'


describe Holster::Plugins do
  
  it "should know registered plugins" do
    Holster::Plugins.new
    Holster::Plugins.registered.should == ['foo']
  end
  
end