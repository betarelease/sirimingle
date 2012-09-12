require 'httparty'

class MingleParty
  include HTTParty

  def initialize(host, username, password, project)
    @uri = "#{host}/api/v2/projects/#{project}"
    @auth = {:username => username, :password => password}
  end

  def get(number)    
    self.class.get("#{@uri}/cards/#{number}.xml", :basic_auth => @auth)
  end
  
end
