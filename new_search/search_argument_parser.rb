class SearchArgumentParser
  def parse!
    options = {}
    OptionParser.new do |opts|
      opts.banner = "Usage: st keywords [options]
      examples:
      st word1 word2 --depth=20
      st word1 word2 -t DESC -c"

      opts.on("-dCOUNT", "--depth=COUNT", "Display depth COUNT of content, default depth is 8; example --depth=5") do |d|
        options[:depth] = d
      end

      opts.on("-i FILETYPES", "--include=FILETYPES", "Include file type; the FILETYPES will be from --list_file_types; example --include='ruby,sass,js'") do |i|
        options[:include] = i
      end

      opts.on("-t[ASC]", "--sort-by-date[=ASC]", "Sort result by date, default is sort by ascending; example -sd desc --sort=desc") do |s|
        options[:sort_date] = s
      end

      opts.on("-f[ASC]", "--sort-by-file[=ASC]", "Sort result by filename, default is sort by ascending; example -sf desc --sort=desc") do |s|
        options[:sort_file] = s
      end

      opts.on("-c", "--color", "Display result in color") do |c|
        options[:color] = c
      end

      opts.on("-n", "--show-line-number", "Display line number with content") do |n|
        options[:show_line_number] = n
      end

      opts.on("-l", "--list-file-types", "Display all the list of supported file types") do |l|
        options[:list_file_types] = l
      end

      opts.on("-h", "--help", "Prints this help") do
        puts opts
        exit
      end
    end.parse!

    SearchParameter.new(options, ARGV)
  end
end
