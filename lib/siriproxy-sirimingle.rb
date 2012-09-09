require 'cora'
require 'siri_objects'
require 'pp'
require 'api'

class SiriProxy::Plugin::SiriMingle < SiriProxy::Plugin

  def initialize(config)
    @api = API.new(config['host'], config['project'], config['username'], config['password'])
  end

  listen_for /card number ([0-9,]*[0-9])/i do |number|
    say "Card number: #{number} has status #{status(number)}"
    
    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end
  
  # listen_for /move card number ([0-9,]*[0-9]) to /i do |number|
  #   say "Card number: #{number} has status #{status(number)}"
  # 
  #   response = ask "Where should I move this card to? " #ask the user for something
  #   
  #   say "Moving card to #{response}"
  #   
  #   success = @api.put(response.to_s)
  #   if(success)
  #     say "Card #{number} has now moved to #{response}"
  #   else
  #     say "Card #{number} cannot be moved to #{response}"  
  #   end
  # 
  #   request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  # end


  def status(number)
    card = @api.get(number)
    card["card"]["properties"].first["value"]
  end
end
