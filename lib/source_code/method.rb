module SourceCode

  class Method

    attr_reader :source_location

    def initialize source_location
      @source_location = source_location
    end

    def source_code
      lines[first_line...last_line].join
    end

    private

    def file
      source_location[0]
    end

    def first_line
      source_location[1] - 1
    end

    def lines
      @lines ||= File.read(file).lines
    end

    def last_line
      indentation = indentation_on first_line

      index = first_line + 1
      while indentation != indentation_on(index)
        index += 1
      end
      index + 1
    end

    def indentation_on line_number
      lines[line_number].length - lines[line_number].lstrip.length
    end

  end

end
