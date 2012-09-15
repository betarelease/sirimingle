require 'httparty'
require 'crack'

class MingleParty
  include HTTParty

  def initialize(host, username, password, project)
    @uri = "#{host}/api/v2/projects/#{project}"
    @auth = {:username => username, :password => password}
  end

  def get(number)    
    response = self.class.get("#{@uri}/cards/#{number}.xml", :basic_auth => @auth)
    Crack::XML.parse(response.body)
  end
  
  def put(number, status)
    options = { :query => { 'card[properties[][name]' => 'status', 'card[properties][][value]' => status }, 
                :basic_auth => @auth }
    response  = self.class.put( "#{@uri}/cards/#{number}.xml", options )
  end
  
  def post(message)
    options = { :query => { 'murmur[body]' => message }, 
                :basic_auth => @auth }
    response  = self.class.post( "#{@uri}/murmurs.xml", options )
  end
end
