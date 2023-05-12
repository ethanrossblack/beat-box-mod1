class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(data)
    # Safety clause for non-string data
    return if !data.is_a?(String)

    node = Node.new(data)

    if @head == nil
      @head = node
    else
      find_tail.update_next(node)
    end
  end

  def find_tail
    node = @head
    until node.next_node == nil
      node = node.next_node
    end
    node
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