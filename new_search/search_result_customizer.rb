class SearchResultCustomizer
  attr_accessor :files

  def initialize(f)
    @files = f
  end

  def accept(visitors)
    visitors.each do |visitor|
      visitor.visit(self)
    end
  end
end
