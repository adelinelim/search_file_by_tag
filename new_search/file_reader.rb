class FileReader
  DEFAULT_DEPTH_COUNT = 10

  def initialize(file, depth_level)
    @file_path = Configuration.set_full_file_path(file)
    @depth_level = depth_level
  end

  # [ {
  #     filename: 'aaa.js',
  #     tags: ["attr_reader", "something"],
  #     contents: [
  #       { line_number: 1, line_content: "def function" },
  #       { line_number: 2, line_content: "end" }
  #     ],
  #     last_modified: '11-1-2017'
  #   }, ... ]
  def generate_search_result
    {
      filename: @file_path,
      tags: get_tags,
      contents: get_file_content,
      last_modified: get_last_modified
    }
  end

  private

  def set_file_content(line_number, content)
    # chomp removes the last line ending (\n), if present
    { line_number: line_number, line_content: content.chomp }
  end

  def get_file_content
    content = []
    File.open(@file_path).each_with_index do |line, i|
      break if i > get_display_depth_count
      # skip first line; because first line usually is tag
      content << set_file_content(i, line) if i != 0
    end
    content
  end

  def get_last_modified
    File.mtime(@file_path)
  end

  def get_tags
    # read first line
    first_line = File.open(@file_path, &:readline)
    first_line.gsub('\n','').split(" ")
  end

  def get_display_depth_count
    DEFAULT_DEPTH_COUNT || @depth_level
  end
end
