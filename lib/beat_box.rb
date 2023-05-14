class BeatBox
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(data)
    return if !data.is_a?(String)

    beats = data.split(" ")
    beats.each do |beat|
      @list.append(beat)
    end
    data
  end
end