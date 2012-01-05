# Combat

Deploy your iPhone and Android apps to clients with ease. It's like Capistrano, only for mobile apps.

# Install

Run

    gem install combat


# Usage

In your mobile applications directory run

    combat setup
    
This creates a new <tt>config.yml</tt>.

To run a new deploy type

    combat deploy
    
# Configuration

Create a <tt>~/.combatrc</tt> with default configuration for all combat projects, like this example:

    --- 
    :host: my.server.com
    :path: /var/www/myserver/mobile_apps/
    :url: http://my.server.com/mobile_apps    
    :filename: android_file.apk
    :name: My application dev page

# TODO

Todo stuff:

 * Test Android support