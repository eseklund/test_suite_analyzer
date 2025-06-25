# TestSuiteAnalyzer

TestSuiteAnalyzer is a command-line tool and Ruby library for analyzing RSpec and Minitest test suites. It identifies slow, flaky or non-deterministic tests, detects missing or duplicate assertions, and flags other anti-patterns—then generates clear, actionable Markdown or HTML reports to help you speed up and harden your test suite.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'test_suite_analyzer'
```

And then execute:

```bash
$ bundle
```

Or install it yourself:

```bash
$ gem install test_suite_analyzer
```

## Usage

### Command-Line Interface

```bash
# Analyze a project and output Markdown to stdout
$ test_suite_analyzer analyze /path/to/my_project

# Analyze and save HTML report
$ test_suite_analyzer analyze /path/to/my_project \
    --format html \
    --output report.html
```

Run `test_suite_analyzer help` for a full list of commands and options.

### Ruby API

```ruby
require 'test_suite_analyzer'

runner = TestSuiteAnalyzer::Runner.new(
  suite_path:  'spec',          # or 'test' for Minitest
  format:      :markdown,       # :markdown or :html
  output_path: 'test_report.md' # optional, defaults to stdout
)

runner.run
```

You can also drop into an interactive session:

```bash
$ bin/console
> require 'test_suite_analyzer'
> TestSuiteAnalyzer::Runner.new(suite_path: 'spec').run
```

## Development

After cloning:

```bash
$ bin/setup      # install dependencies
$ bundle exec rspec   # run tests
$ bin/console    # interact with your code
```

To release a new version:

1. Bump the version in `lib/test_suite_analyzer/version.rb`.
2. Commit, tag, and push:
   ```bash
   $ git add lib/test_suite_analyzer/version.rb CHANGELOG.md
   $ git commit -m "Release vX.Y.Z"
   $ git tag vX.Y.Z
   $ git push --follow-tags
   ```bash
   $ bundle exec rake release
   ```

## Contributing

Bug reports and pull requests are very welcome! Please head to
<https://github.com/eseklund/test_suite_analyzer> to open issues or submit PRs.

This project follows the [Contributor Covenant](http://contributor-covenant.org) code of conduct—please read [CODE_OF_CONDUCT.md](https://github.com/eseklund/test_suite_analyzer/blob/main/CODE_OF_CONDUCT.md) before contributing.

## Changelog

See [CHANGELOG.md](https://github.com/eseklund/test_suite_analyzer/blob/main/CHANGELOG.md) for details on each release.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
