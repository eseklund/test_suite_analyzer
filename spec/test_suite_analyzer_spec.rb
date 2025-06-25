require "test_suite_analyzer"

RSpec.describe TestSuiteAnalyzer do
  it "has a version number" do
    expect(TestSuiteAnalyzer::VERSION).not_to be_nil
  end
end
