class Search2
  DEFAULT_DEPTH_COUNT = 8
  FUNCTIONS = {
    depth: "depth=",
    include: "in="
  }

  def initialize(grep_parameters)
    @grep_parameters = grep_parameters
    @filenames = search_filenames
  end

  def get_keywords
    get_cleaned_keywords.map do |keyword|
      "##{keyword}"
    end
  end

  # [
  #   { filename: … , tags: [‘private’, ‘meow’], content: “…….”, last_modified: “2017…” },
  #   { filename: … , tags: [‘private’, ‘meow’], content: “…….”, last_modified: “2017…” }
  # ]
  def generate_search_result_in_hash
    result = filenames.split("\n")
    result.map do |file_name|
      { filename: file_name, content: get_file_content(file_name) }
    end
  end

  private

  attr_reader :grep_parameters, :filenames

  def get_cleaned_keywords
    grep_parameters.reject do |keyword|
      exclude_functions_params(keyword)
    end
  end

  def exclude_functions_params(text)
    FUNCTIONS.values.any? do |fn|
      text.start_with?(fn)
    end
  end

  # returns list of file names
  def search_filenames
    # * => all files
    # r => search from its subdirectories
    # i => ignore cases
    # l => list file name
    # c => show word occurence count
    # w => words

    args = set_args
    # grep -ril '#keyword1' --include=\*.rb *
    `grep -ril '#{args}' #{search_extension} *`
  end

  # \| => to match multiple words e.g 'word1\|word2\|word3'
  # or can use egrep instead of grep for multiple words search
  def set_args
    get_keywords.join("\\|")
  end

  def get_display_depth_count
    grep_parameters.grep(/#{FUNCTIONS[:depth]}/).last&.split(FUNCTIONS[:depth])&.last&.to_i ||
      DEFAULT_DEPTH_COUNT
  end

  def include_extension
    #--include=\*.h --include=\*.cpp
    extensions = grep_parameters.grep(/#{FUNCTIONS[:include]}/).last&.split(FUNCTIONS[:include])&.last&.split(",")
    extensions&.map do |ext|
      "--include=\\*.#{ext}"
    end&.join(" ")
  end

  def search_extension
    include_extension || ""
  end

  def get_file_content(file_name)
    file_path = Configuration2.set_full_file_path(file_name)
    content = []
    File.open(file_path).each_with_index do |line, i|
      break if i > get_display_depth_count
      content << line
    end
    content.join("")
  end
end
