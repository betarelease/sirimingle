require 'crack'

class SiriProxy::Plugin::API

  def initialize(host, project, username, password)
    @host = host
    @project = project
    @username = username
    @password = password
    @project = project || 'siri_mingle_test'    
  end
  
  def get(number)
    card_xml = `curl https://#{@username}:#{@password}@#{@host}/api/v2/projects/#{@project}/card/#{number}.xml`
    puts "[DEBUG] card_xml => #{card_xml.inspect}"
    Crack::XML.parse(card_xml)
  end
  
  def put(*args)
  end

end