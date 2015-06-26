require "source_code/version"

class Method
  def source_code
    File.read(source_location[0]).lines[source_location[1]-1...source_location[1] + 2].join
  end
end
