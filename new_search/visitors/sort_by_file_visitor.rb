class SortByFileVisitor
  def initialize(sort_order = "ASC")
    @sort_order = sort_order
  end

  def visit(customizer)
    # sort date by asc
    files = customizer.files.sort_by {|f| f[:filename] }

    # sort date by desc
    files = files.reverse if @sort_order.casecmp("DESC") == 0

    customizer.files = files
  end
end
