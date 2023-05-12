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
    data
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
    return if @head.nil?
    
    string = @head.data
    node = @head.next_node
    until node.nil?
      string += " #{node.data}"
      node = node.next_node
    end
    string
  end

  def prepend(data)
    holder = @head
    @head = Node.new(data)
    @head.update_next(holder)
    data
  end

  def insert(index, data)
    node = @head
    
    (index-1).times do
      node = node.next_node
    end

    new_node = Node.new(data)
    new_node.update_next(node.next_node)
    node.update_next(new_node)
    data
  end
end