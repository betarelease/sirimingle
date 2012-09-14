sirimingle
==========

Use Siri to interact with Mingle. This is a SiriProxy plugin to help you interact with the Mingle api.


The following commands are currently supported

* Any command with 'card status <1234>' where <1234> is the card number you are interested in
  - will reply with card status for card <1234>
    
* Any command with 'change card <1234>'
  - allows you to change the name of card <1234>
  - will ask for new name and reply with command completion status

Usage
-----

Copy the contents of config.info.yml and change them to match your login/password/hostname for mingle. Add this copy into your ~/.siriproxy/config.yaml.

In your SiriProxy location Run 

`rake install #this will install all the dependencies including the sirimingle gem`

`siriproxy bundle #will bundle all the gems with siriproxy`

`rvmsudo siriproxy server #this should start your siriproxy server on port 443 with sirimingle installed`




Copyright (c) Sudhindra Rao 2012
This project is available for use in compliance with the Apache License.