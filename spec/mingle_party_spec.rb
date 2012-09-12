require 'spec_helper'
require 'yaml'
require 'crack'

describe MingleParty do
  
  before :all do
    @config = YAML.load(File.read("./config.yml")).first
  end
  
  it "should find card" do
    mingle = MingleParty.new(@config['host'], @config['username'], @config['password'], @config['project'])
    card = mingle.get(13)

    card['card']['properties'].first['value'].should =~ /done/
    card['card']['name'].should =~ /card 13/
    card['card']['description'].should == nil
  end

end
