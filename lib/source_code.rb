require_relative "source_code/method"
require_relative "source_code/monkey_patch"
require_relative "source_code/version"

module SourceCode

  def self.extract_source_for source_location
    Method.new(source_location).source_code
  end

end
