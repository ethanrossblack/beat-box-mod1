class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(data)
    # Guard clause for non-string data
    return unless data.is_a?(String)

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
    if @head.nil?
      0
    else
      counter = 1
      node = @head
      until node.next_node.nil?
        counter += 1
        node = node.next_node
      end
      counter
    end
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

  def find(index, nodes)
    return if nodes == 0

    node = @head
    index.times do
      node = node.next_node
    end

    found = node.data
    (nodes-1).times do
      node = node.next_node
      found += " #{node.data}"
    end

    found
  end

  def includes?(data)
    false if @head.nil?

    node = @head

    until node.next_node.nil? || node.data == data
      node = node.next_node
    end

    node.data == data ? true : false
  end

  def pop
    return if @head.nil?

    popped = @head

    if @head.next_node.nil?
      @head = nil
      popped
    else
      node = @head

      until node.next_node.next_node.nil?
        node = node.next_node
      end

      popped = node.next_node
      node.update_next(nil)
      
      popped
    end
  end
end