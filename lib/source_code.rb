require "source_code/monkey_patch"
require "source_code/version"

module SourceCode
  def self.extract_source_for source_location
    file = source_location[0]
    starting_point = source_location[1] - 1

    lines = File.read(file).lines
    indentation = lines[starting_point].length - lines[starting_point].lstrip.length

    end_point = starting_point + 1
    end_indentation = lines[end_point].length - lines[end_point].lstrip.length

    while end_indentation != indentation
      end_point += 1
      end_indentation = lines[end_point].length - lines[end_point].lstrip.length
    end
    end_point += 1
    File.read(file).lines[starting_point...end_point].join
  end
end
