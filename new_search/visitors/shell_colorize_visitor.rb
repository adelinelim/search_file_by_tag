class ShellColorizeVisitor
  COLOR_PREFIX = "\e[38;05;" # from 0~255 different colour code e.g. "\e[38;05;99m"
  DEFAULT_COLOR_ID = "15" # White
  HIGHTLIGHT_COLOR = "\e[1;36m" # Bold Cyan
  CLOSING_TAG = "\e[0m"

  def initialize(config_color_data)
    @config_color_data = config_color_data
  end

  def visit(customizer)
    customizer.files.each do |single_file|
      color_code = get_color_code(single_file[:filename])
      # single_file[:contents] = color_contents(single_file[:contents], color_code)
      single_file[:filename] = color_filename(single_file[:filename], color_code)
      # single_file.to_s.gsub("\\e[", "\e[")
      single_file
    end

  end

  private

  def get_color_code(file_name)
    file_ext = Configuration.get_file_extension(file_name)
    @config_color_data[file_ext] || DEFAULT_COLOR_ID
  end

  def color_filename(filename, color_code)
    "#{COLOR_PREFIX}#{color_code}m#{filename}#{CLOSING_TAG}"
  end

  def color_contents(contents, color_code)
    contents.map do |content_hash|
      {
        line_number: content_hash[:line_number],
        line_content: "#{COLOR_PREFIX}#{color_code}m#{content_hash[:line_content]}#{CLOSING_TAG}"
      }
    end
  end
end
