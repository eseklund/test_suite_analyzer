
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "test_suite_analyzer/version"

Gem::Specification.new do |spec|
  spec.name          = "test_suite_analyzer"
  spec.version       = TestSuiteAnalyzer::VERSION
  spec.authors       = ["Eric Eklund"]
  spec.email         = ["eseklund@gmail.com"]

  spec.summary       = %q{Analyze and report on the performance and reliability of your Ruby test suite.}
  spec.description   = %q{
    TestSuiteAnalyzer is a command-line tool and Ruby library for analyzing RSpec and Minitest suites.
    It identifies slow, flaky or non-deterministic tests, detects missing or duplicate assertions, and flags other anti-patterns.
    It then generates clear, actionable Markdown or HTML reports to help you speed up and harden your test suite.
  }
  spec.homepage      = "https://github.com/eseklund/test_suite_analyzer"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/eseklund/test_suite_analyzer"
    spec.metadata["changelog_uri"] = "https://github.com/eseklund/test_suite_analyzer/blob/main/CHANGELOG.md"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.10"
end
