require 'spec_helper'
require 'yaml'

describe MingleParty do
  
  before :all do
    @config = YAML.load(File.read("./config.yml")).first
  end
  
  it "should find card" do
    mingle = MingleParty.new(@config['host'], @config['username'], @config['password'], @config['project'])
    response = mingle.get(13)
    
    response.code.should == 200
    response.body.should =~ /card 13/
  end

  
  
end
