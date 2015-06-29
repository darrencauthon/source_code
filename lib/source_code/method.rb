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
      indentation = lines[starting_point].length - lines[starting_point].lstrip.length

      end_point = starting_point + 1
      end_indentation = lines[end_point].length - lines[end_point].lstrip.length

      while end_indentation != indentation
        end_point += 1
        end_indentation = lines[end_point].length - lines[end_point].lstrip.length
      end
      end_point += 1
    end

    def source_code
      lines[starting_point...ending_point].join
    end

  end

end
