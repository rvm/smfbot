Gem::Specification.new do |s|
  s.name        = 'smfbot'
  s.version     = '1.0.0'
  s.summary     =
  s.description = 'IRC bot engine build for #smf.sh and related channels.'
  s.authors     = ['Michal Papis']
  s.email       = ['mpapis@gmail.com']
  s.homepage    = 'https://github.com/mpapis/smfbot'
  s.files       = Dir['LICENSE', 'README.md', 'lib/**/*', 'bin/*']
  s.executables = ['smfbot']
  s.required_ruby_version = '>= 1.9.1'
  s.add_dependency("cinch",     "~>2")
end
