class Search
  def initialize(search_parameters)
    @search_parameters = search_parameters
    if @search_parameters.list_file_types?
      # list all the supported file types
      puts `ag --list-file-types`
    else
      keyword_search
    end
  end

  private

  def keyword_search
    if @search_parameters.keywords.present?
      files = get_searched_file_list
      result = generate_search_result_lists(files)
    else
      puts "must supply keywords; run st --help for more information"
    end
  end

  def generate_search_result_lists(files)
    result = SearchResultCustomizer.new(
      files.map do |file|
        FileReader.new(file, @search_parameters.depth).generate_search_result
      end
    )
    set_visitors(result)
  end

  def set_visitors(result)
    visitors = []

    if @search_parameters.colorize?
      config_color_data = Configuration.get_config_color
      visitors << ShellColorizeVisitor.new(config_color_data)
    end

    if @search_parameters.show_line_number?
      visitors << ContentWithLineNumberVisitor.new
    else
      visitors << ContentOnlyVisitor.new
    end

    sort_date = @search_parameters.sort_by_date
    if sort_date
      visitors << SortByDateVisitor.new(sort_date)
    end

    sort_file = @search_parameters.sort_by_file
    if sort_file
      visitors << SortByFileVisitor.new(sort_file)
    end

    visitors << FullDisplayVisitor.new

    result.accept(visitors)
  end

  def get_searched_file_list
    keywords = @search_parameters.keywords
    include_file_list = include_files(@search_parameters.include_extension)
    first_keyword = keywords.first
    selected_files = AgGrepSearchStrategy.new.search_all_files(first_keyword, include_file_list)
    remaining_keywords = get_remaining_keywords(keywords, first_keyword)
    AgGrepSearchStrategy.new.search_in_selected_files(remaining_keywords, selected_files)
  end

  def include_files(files)
    files&.split(",")
  end

  def get_remaining_keywords(keywords, first_keyword)
    # filtered the first keyword
    keywords.reject { |kw| kw == first_keyword }
  end
end
