Gem::Specification.new do |s|
  s.name    = 'combat'
  s.version = '0.7'
  s.date    = '2011-07-08'
  
  s.summary = "Deploy your iPhone and Android apps to clients with ease. It's like Capistrano, only for mobile apps."
  s.description = "Deploy your iPhone and Android apps to clients with ease. It's like Capistrano, only for mobile apps."
  
  s.authors  = ['Tomislav Car']
  s.email    = ['tomislav@infinum.hr']
  s.homepage = 'http://github.com/infinum/combat'
  
  s.has_rdoc = true
  s.rdoc_options = ['--main', 'Readme.md']
  s.rdoc_options << '--inline-source' << '--charset=UTF-8'
  s.extra_rdoc_files = ['Readme.md', 'LICENSE']
  
  s.require_paths = ["lib"]  
  
  s.files = %w(
      Readme.md
      LICENSE 
      Gemfile
      Gemfile.lock
      bin/combat
      Readme.md
      lib/settings.rb
      templates/template_iphone.erb
    )

    s.test_files = %w()
end
