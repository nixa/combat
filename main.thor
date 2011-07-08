$LOAD_PATH.unshift File.dirname(__FILE__)
require "rubygems"
require "bundler/setup"

# gems and libraries
require 'ostruct'
require 'erb'

# local classes
require 'settings'

class Combat < Thor
  include Thor::Actions

  desc "setup", "Setup a new mobile project for deploying"
  def setup
    settings = {
      :type => 'iphone',
      :name => 'New project',
      :host => 'my.hostname.com',
      :path => '/var/www/my.hostname.com/deploy_folder',
      :url => 'http://my.hostname.com/deploy_folder',
      :remote_user => 'www-data'
    }    

    unless File.exists?('combat.yml')
      create_file 'combat.yml', settings.to_yaml
    end
  end
  
  desc "deploy", "Deploy a project to the server for testing"
  def deploy
    load_config
    
    if @config.valid?
      system "ssh #{@config.user_and_host} 'mkdir -p #{@config.path}'"
      system "ssh #{@config.user_and_host} 'rm -fr #{@config.path}/*'"
      File.open('index.html', 'w+'){|x| 
        str = generate_html_file
        x.puts generate_html_file
      }
      system "scp index.html #{@config.user_and_host}:#{@config.path}"
      remove_file 'index.html'
      # system "scp -r app/config www-data@vz1.infinum.hr:l/labs.infinum.hr/rba/stage/config"    
    else
      say "Config not valid, please check"
    end
  end

  no_tasks do
    def load_config
      string = File.read("combat.yml")
      yml = YAML::load(string)
      @config = Settings.new(yml)      
    end
    
    def header(text)
      say "=" * text.size
      say text
      say "=" * text.size    
    end
    
    def generate_html_file
      erb = ERB.new(File.read("template_#{@config.type}.erb"))
      erb.result(@config.get_binding)
    end    
  end

end