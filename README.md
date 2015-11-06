# PageDownloader

Downloads a web page into a file embeding javascript and css into it.

[![Build Status](https://travis-ci.org/mjacobus/page_downloader.svg)](https://travis-ci.org/mjacobus/page_downloader)
[![Code Coverage](https://scrutinizer-ci.com/g/mjacobus/page_downloader/badges/coverage.png?b=master)](https://scrutinizer-ci.com/g/mjacobus/page_downloader/?branch=master)
[![Code Climate](https://codeclimate.com/github/mjacobus/page_downloader/badges/gpa.svg)](https://codeclimate.com/github/mjacobus/page_downloader)
[![Scrutinizer Code Quality](https://scrutinizer-ci.com/g/mjacobus/page_downloader/badges/quality-score.png?b=master)](https://scrutinizer-ci.com/g/mjacobus/page_downloader/?branch=master)
[![Dependency Status](https://gemnasium.com/mjacobus/page_downloader.svg)](https://gemnasium.com/mjacobus/page_downloader)
[![Gem Version](https://badge.fury.io/rb/page_downloader.svg)](https://badge.fury.io/rb/page_downloader)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'page_downloader'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install page_downloader

## Usage

```ruby
page = "http://mjacobus.github.io/2015/08/28/resolving-github-token-issue-in-composer.html"

PageDownloader.new(page).to_file("/tmp/downloaded.html")
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mgjacobus/page_downloader. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

