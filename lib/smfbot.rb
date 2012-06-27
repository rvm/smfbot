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
      configure do |c|
        c.load settings['connection']
        c.plugins.plugins = []
      end
    end
    (settings['plugins'] || []).each{ |plugin, options| add_plugin(plugin, options) }
  end

  def add_plugin(plugin, options = nil)
    @bot.info "loading plugin: #{plugin} with options: #{options}."
    require plugin.downcase.gsub('::','/')
    @bot.configure do |c|
      plugin = eval plugin
      c.plugins.plugins << plugin
      c.plugins.options[plugin] = options if options
    end
  rescue Exception => e
    @bot.warn "failed loading plugin: #{plugin} ->\n"
    raise e
  end

  def start
    @bot.start
  end
end
