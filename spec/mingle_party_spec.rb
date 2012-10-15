require 'spec_helper'

describe MingleParty do
  
  before :all do
    @config = YAML.load(File.read("./config.yml")).first
  end
  
  it "should find card" do
    mingle = MingleParty.new(@config['host'], @config['username'], @config['password'], @config['project'])
    card = mingle.fetch_card(13)

    card['card']['properties'].first['value'].should =~ /Just started/
    card['card']['name'].should =~ /card 13/
    card['card']['description'].should =~ /I love Siri and So should you/
  end

  it "should change card status to done" do
    mingle = MingleParty.new(@config['host'], @config['username'], @config['password'], @config['project'])
    card = mingle.change_card_status(11, "done")

    card['card']['name'].should =~ /Implement the SiriMingle Feature/
    card['card']['properties'].first['value'].should =~ /done/
  end

  it "should murmur about its happiness" do
    mingle = MingleParty.new(@config['host'], @config['username'], @config['password'], @config['project'])
    murmur = mingle.murmur('happy to mingle xoxo siri', 'murmur[body]')

    murmur['murmur']['body'].should =~ /happy to mingle/
  end
  
end
