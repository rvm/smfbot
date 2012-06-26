require "cinch"
require "yaml"

class SmfBot
  def initialize(params)
    if File.exist?('config.yaml')
      settings = YAML.load_file('config.yaml')||{}
    else
      raise "\n\n  Missing configuration file 'config.yaml'.\n\n"
    end
    @bot = Cinch::Bot.new do
      debug "settings <<-EOF\n#{settings.to_yaml}EOF"
      configure do |c|
        c.server   = settings['server']
        c.port     = settings['port']
        c.channels = settings['channels']
        c.nick     = settings['nick']
        c.username = settings['nick']
        c.plugins.plugins = []
      end
    end
    (settings['plugins'] || []).each{ |plugin, options| add_plugin(plugin, options) }
  end

  def add_plugin(plugin, options = nil)
    @bot.info "loading plugin: #{plugin}."
    @bot.configure do |c|
      require plugin.downcase.gsub('::','/')
      plugin = eval plugin
      c.plugins.plugins << plugin
      c.plugins.options[plugin] = options if options
    end
  rescue
    @bot.warn "failed loading plugin: #{plugin} ->\n#{}"
  end

  def start
    @bot.start
  end
end
