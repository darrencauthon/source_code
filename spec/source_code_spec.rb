require_relative 'spec_helper'

class AClassForTesting
  def hey
  end
end

describe :source_location do

  let(:method) { AClassForTesting.new.method(:hey) }

  it "should monkey-patch source_code on to Method" do
    method.respond_to?(:source_code).must_equal true
  end

end
