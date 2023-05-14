class BeatBox
  attr_reader :list

  def initialize(data = nil)
    @list = LinkedList.new
    @valid_beats = %w[tee dee deep bop boop la na doo ditt woo hoo shu]
    self.append(data)
  end

  def append(data)
    return if !data.is_a?(String)

    beats = data.split(" ")
    beats.each do |beat|
      @list.append(beat)
    end
  end

  def count
    @list.count
  end

  def play
    `say -r 500 -v Boing #{@list.to_string}`
    count
  end

  def all
    @list.to_string
  end
end