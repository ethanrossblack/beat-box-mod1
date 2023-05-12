class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(data)
    node = Node.new(data)
    @head = node
  end

  def count
    1
  end

  def to_string
    @head.data.to_s
  end
end