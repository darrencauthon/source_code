require_relative 'spec_helper'

class AClassForTesting
  def hey
    1 + 1
  end
end

describe :source_location do

  let(:method) { AClassForTesting.new.method(:hey) }

  it "should monkey-patch source_code on to Method" do
    method.respond_to?(:source_code).must_equal true
  end

  it "should report back the contents of the method" do
    method.source_code.must_equal <<EOF
  def hey
    1 + 1
  end
EOF
      
  end

end
