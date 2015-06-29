class Method
  def source_code
    SourceCode.extract_source_for source_location
  end
end
