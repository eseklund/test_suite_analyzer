require "optparse"

module TestSuiteAnalyzer
  class Runner
    attr_reader :options, :suite_path

    def initialize(argv = ARGV)
      @options = parse_options(argv)
      @suite_path = options[:path]
    end

    def run
      # TODO: load test files, analyze them, and produce report
      puts "Analyzing #{suite_path.inspect}…"
    end

    private

    def parse_options(argv)
      opts = { format: :markdown, output: nil }
      parser = OptionParser.new do |o|
        o.banner = "Usage: test_suite_analyzer analyze PATH [options]"

        o.on("-f", "--format FORMAT", "markdown or html (default: markdown)") do |f|
          opts[:format] = f.to_sym
        end

        o.on("-o", "--output FILE", "write report to FILE (default stdout)") do |o|
          opts[:output] = o
        end

        o.on_tail("-h", "--help", "Show this message") do
          puts o
          exit
        end
      end

      parser.parse!(argv)
      opts[:path] = argv.shift or abort parser.banner
      opts
    end
  end
end
