class BeatBox
  attr_reader :list, :valid_beats
  attr_accessor :rate, :voice

  def initialize(data = nil)
    @list = LinkedList.new
    @valid_beats = %w[tee dee deep bop boop la na doo ditt woo hoo shu]
    @rate = 500
    @voice = "Boing"
    self.append(data)
  end

  def append(data)
    return if !data.is_a?(String)

    beats = data.split(" ")
    beats.each do |beat|
      @list.append(beat) if validate_beat(beat)
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

  def validate_beat(beat)
    @valid_beats.include?(beat)
  end

  def prepend(data)
    return unless data.is_a?(String)

    beats = data.split(" ")
    beats.each do |beat|
      @list.prepend(beat) if validate_beat(beat)
    end
  end

  def reset_rate
    @rate = 500
  end

  def reset_voice
    @voice = "Boing"
  end
end