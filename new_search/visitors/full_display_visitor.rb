class FullDisplayVisitor
  def visit(customizer)
    customizer.files.each do |file|
      puts file[:filename]
      puts file[:tags]
      puts file[:content_string]
      puts file[:last_modified]
    end
  end
end
