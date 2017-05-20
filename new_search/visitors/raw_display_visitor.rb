class RawDisplayVisitor
  def visit(customizer)
    puts JSON.pretty_generate customizer.files
  end
end
