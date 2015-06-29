require "source_code/version"

class Method
  def source_code
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
