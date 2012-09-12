require 'cora'
require 'siri_objects'
require 'pp'
require 'mingle_party'
require 'crack'

class SiriProxy::Plugin::SiriMingle < SiriProxy::Plugin
  def initialize(config)
    @mingle = ::MingleParty.new(config['host'], config['username'], config['password'], config['project'])
  end
  
  listen_for /find story ([0-9,]*[0-9])/i do |number|
    card = @mingle.get(number)
    
    say "Card number: #{number} has status #{card['card']['properties'].first['value']}"

    response = ask "What would you like to know about this card?"

    property = card['card'][response.downcase]
    if property
      say "Card number: #{number} has #{response} : #{property}"
    else
      say "Could not find #{response} about card number #{number}"
    end
    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end
  
  # listen_for /change card ([0-9,]*[0-9]) to /i do |number|    
  #   say "Card number: #{number} has status #{status(number)}"
  # 
  #   response = ask "What should I name this card to? " #ask the user for something
  #   
  #   say "Changing card name to #{response}"
  #   
  #   success = @api.put(response.to_s)
  #   if(success)
  #     say "Card #{number} has now changed to #{response}"
  #   else
  #     say "Card #{number} cannot be changed to #{response}"  
  #   end
  # 
  #   request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  # end
  # 
end
