class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(data)
    # Safety clause for non-string data
    return if !data.is_a?(String)

    node = Node.new(data)

    if @head.nil?
      @head = node
    else
      find_tail.update_next(node)
    end
  end

  def find_tail
    # Safety clause for an empty head
    return if @head.nil?
    
    node = @head
    until node.next_node.nil?
      node = node.next_node
    end
    node
  end

  def count
    0 if @head.nil?
    
    counter = 1
    node = @head
    until node.next_node.nil?
      counter += 1
      node = node.next_node
    end
    counter
  end

  def to_string
    if @head
      @head.data
    end
  end
end