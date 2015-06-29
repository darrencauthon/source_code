require_relative '../spec_helper'

class AClassForTesting
  def hey
    1 + 1
  end
end

class AnotherFileForTesting
  def do_some_math
    1 + 1
    2 + 3
    4 + 5
    5 + 10
  end
end

describe :source_location do

  describe "first example" do
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

  describe "second example" do

    let(:method) { AnotherFileForTesting.new.method(:do_some_math) }

    it "should monkey-patch source_code on to Method" do
      method.respond_to?(:source_code).must_equal true
    end

    it "should report back the contents of the method" do
      method.source_code.must_equal <<EOF
  def do_some_math
    1 + 1
    2 + 3
    4 + 5
    5 + 10
  end
EOF
    end

  end

end
