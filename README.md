# SMF Bot

IRC bot engine build for `#smf.sh` and related channels, quite similar to [cinchize](https://github.com/netfeed/cinchize).

# Example

`Gemfile`:

    source "https://rubygems.org"
    #ruby=1.9.3
    #ruby-gemset=cinch
    gem "cinch-identify"
    gem "cinch-yaml-memo"
    gem "cinch-url-scraper"

`config.yaml`:

    ---
    connection:
      :server: irc.freenode.net
      :port: 6667
      :nick: user
      :delay_joins: :identified
      :channels:
        - "#my-test-channel"
    plugins:
      "Cinch::Plugins::Identify":
        :type: :nickserv
        :username: "user"
        :password: "password"
      "Cinch::Plugins::YamlMemo":
      "Cinch::Plugins::UrlScraper":

and run:

    smfbot

# Backup

Do not forget to backup directory in which bot is running.
