require "test_suite_analyzer"

RSpec.describe TestSuiteAnalyzer::Runner do
  it "requires a path argument" do
    expect {
      TestSuiteAnalyzer::Runner.new([])
    }.to raise_error(SystemExit)
  end

  it "parses format and output options" do
    runner = TestSuiteAnalyzer::Runner.new(%w[--format html --output r.html spec])
    expect(runner.options[:format]).to eq(:html)
    expect(runner.options[:output]).to eq("r.html")
    expect(runner.suite_path).to eq("spec")
  end
end
