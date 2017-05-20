class ContentOnlyVisitor
  def visit(customizer)
    customizer.files.map do |file|
      content_strings = file[:contents].map do |line|
        line[:line_content]
      end

      file[:content_string] = content_strings.join("\n")
    end
  end
end
