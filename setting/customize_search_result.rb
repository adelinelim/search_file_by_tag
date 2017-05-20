class CustomizeSearchResult
  COLOR_PREFIX = "\e[38;05;" # from 0~255 different colour code e.g. "\e[38;05;99m"
  DEFAULT_COLOR_ID = "15" # White
  HIGHTLIGHT_COLOR = "\e[1;36m" # Bold Cyan
  CLOSING_TAG = "\e[0m"

  def initialize(filename:, content:, keywords:, color_code:)
    @content = content
    @filename = filename
    @keywords = keywords
    @color_code = color_code || DEFAULT_COLOR_ID
  end

  def color_search_result
    "#{color_filename} => #{highlight_keywords_from_content}"
  end

  private

  attr_reader :filename, :content, :keywords, :color_code

  def color_filename
    "#{COLOR_PREFIX}#{color_code}m#{filename}"
  end

  def highlight_keywords_from_content
    colored_content = content
    keywords.each do |keyword|
      colored_content = colored_content.gsub(
        keyword, "#{HIGHTLIGHT_COLOR}#{keyword}#{CLOSING_TAG}#{COLOR_PREFIX}#{color_code}m"
      )
    end
    colored_content
  end
end
