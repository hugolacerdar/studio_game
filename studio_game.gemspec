Gem::Specification.new do |s|
    s.name         = "studio_game_x"
    s.version      = "1.0.0"
    s.author       = "Hugo Lacerda Rocha"
    s.email        = "contact@hugolacerda.dev"
    s.homepage     = "https://hugolacerda.dev"
    s.summary      = "A game simple game application."
    s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))
  
    s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
    s.test_files    = Dir["spec/**/*"]
    s.executables   = [ 'studio_game' ]
    
    s.required_ruby_version = '>=2.3'
    s.add_development_dependency 'rspec', '~> 2.8', '>= 2.8.0'
  end
  