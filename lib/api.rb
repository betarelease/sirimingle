require 'crack'

# class SiriProxy::Plugin::API
# 
#   def initialize(host, project, username, password)
#     @host = host
#     @project = project
#     @username = username
#     @password = password
#     @project = project || 'siri_mingle_test'    
#   end
#   
#   def get(number)
#     card_xml = `curl https://#{@username}:#{@password}@#{@host}/api/v2/projects/#{@project}/cards/#{number}.xml`
#     Crack::XML.parse(card_xml)
#   end
#   
#   def put(names)
#     `curl -X PUT -d 'card["properties"][]=#{name} https://#{@username}:#{@password}@#{@host}/api/v2/projects/#{@project}/cards/#{number}.xml`    
#   end
# 
# end

require 'httparty'

class SiriProxy::Plugin::API
  include HTTParty
  base_uri ''

  def initialize(host, project, username, password)
    base_uri host
    @project = project
    @auth = {:username => username, :password => password}
    @project = project || 'siri_mingle_test'    
  end

  def get(number)
    
  end
  
  def post(text)
    options = { :query => {:status => text}, :basic_auth => @auth }
    self.class.post("/api/v2/projects/#{@projects}/cards/#{@number}.xml", options)
  end
  
end

# Twitter.new('username', 'password').post("It's an HTTParty and everyone is invited!")