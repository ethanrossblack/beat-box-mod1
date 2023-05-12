class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(data)
    @head = Node.new(data)
  end

  def count
    if @head
      1
    else
      0
    end
  end

  def to_string
    if @head
      @head.data
    end
  end
end