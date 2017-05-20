class SearchParameter
  def initialize(parsed_options, keywords_arguments)
    @parsed_options = parsed_options
    @keywords_arguments = keywords_arguments
  end

  def keywords
    @keywords_arguments
  end

  def colorize?
    @parsed_options[:color].present?
  end

  def include_extension
    # ag -il hello -G "/.*txt[^/]*$"
    # ag -il hello --ruby
    # list all the file types
    # ag --list-file-types
    @parsed_options[:include]
  end

  def sort_by_date
    if @parsed_options.has_key?(:sort_date)
      @parsed_options[:sort_date] || "ASC"
    end
  end

  def sort_by_file
    if @parsed_options.has_key?(:sort_file)
      @parsed_options[:sort_file] || "ASC"
    end
  end

  def depth
    @parsed_options[:depth]
  end

  def show_line_number?
    @parsed_options[:show_line_number].present?
  end

  def list_file_types?
    @parsed_options[:list_file_types].present?
  end
end
