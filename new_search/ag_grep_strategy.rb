class AgGrepSearchStrategy
  def search_all_files(keyword, file_list)
    # returns all file lists that match the keyword
    @file_list = file_list
    filenames = `ag -il #{keyword} #{generate_included_list}`
    filenames.split("\n")
  end

  def search_in_selected_files(keywords, filenames)
    # -i => ignore case; Match case-insensitively
    # -l => Only print the names of files containing matches, not the matching lines
    # -r => search from its subdirectories
    # returns matched files from the given file lists
    # always pass in the new filtered filenames to search with new keyword
    keywords.reduce(filenames) do |filtered_files, keyword|
      filtered_files.select do |file|
        `grep -ril '#{keyword}' #{file}`.present?
      end
    end
  end

  private

  def generate_included_list
    @file_list&.map do |f|
      "--#{f}"
    end.join(" ")
  end
end
