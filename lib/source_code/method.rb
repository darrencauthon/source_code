module SourceCode

  class Method

    attr_reader :source_location

    def initialize source_location
      @source_location = source_location
    end

    def file
      source_location[0]
    end

    def starting_point
      source_location[1] - 1
    end

    def lines
      @lines ||= File.read(file).lines
    end

    def ending_point

      indentation = indentation_on starting_point

      index = starting_point + 1
      end_indentation = lines[index].length - lines[index].lstrip.length

      while end_indentation != indentation
        index += 1
        end_indentation = lines[index].length - lines[index].lstrip.length
      end
      index + 1
    end

    def indentation_on line_number
      lines[line_number].length - lines[line_number].lstrip.length
    end

    def source_code
      lines[starting_point...ending_point].join
    end

  end

end
