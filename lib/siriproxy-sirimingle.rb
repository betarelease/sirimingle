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
    card = @mingle.fetch_card(number)
    
    say "Card number: #{number} has status #{card['card']['properties'].first['value']}"

    response = ask "What would you like to know about this card?"

    property = card['card'][response.strip.downcase]
    if property
      say "Card number: #{number} has #{response} : #{property}"
    else
      say "Could not find #{response} about card number #{number}"
    end
    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end
  
  listen_for /change status of ([0-9,]*[0-9])/i do |number|
    card = @mingle.fetch_card(number)
    
    say "Card number: #{number} has status #{card['card']['properties'].first['value']}"
  
    response = ask "What should I change the status of this card to? " #ask the user for something
    
    say "Changing card status to #{response}"
    
    success = @mingle.change_card_status(number, response.to_s)
    if(success)
      say "Card #{number} has now changed to #{response}"
    else
      say "There was an error connecting to mingle."  
    end
  
    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end
  
  listen_for /[comment|Comment] ([.*])/ do |message|
    say "Murmuring this for you : #{message}"

    success = @mingle.murmur(message)
    if(success)
      say "Murmured your message"
    else
      say "There was an error connecting to mingle"  
    end

    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end
  
end
