require "./lib/beat_box"
require "./lib/linked_list"
require "./lib/node"
require "rspec"

describe BeatBox do
  before(:each) do
    @bb = BeatBox.new
  end

  context "#initialize" do
    it "exists" do
      expect(@bb).to be_a(BeatBox)
    end

    it "initializes an empty LinkedList by default" do
      expect(@bb.list).to be_a(LinkedList)
      expect(@bb.list.head).to be nil
    end

    it "can initialize with a single beat" do
      @bb = BeatBox.new("deep")
  
      expect(@bb.count).to eq(1)
    end

    it "can initlaize with multiple beats" do
      @bb = BeatBox.new("deep doo")
  
      expect(@bb.count).to eq(2)
    end
  end

  context "#append" do
    it "can append a single beat" do
      @bb.append("deep")
      
      expect(@bb.list.head.data).to eq("deep")
      expect(@bb.list.head.next_node).to be nil
      expect(@bb.count).to eq(1)
      expect(@bb.all).to eq("deep")
    end
    
    it "can append multiple beats at once" do
      @bb.append("deep doo ditt")
      
      expect(@bb.list.head.data).to eq("deep")
      expect(@bb.list.head.next_node.data).to eq("doo")
      expect(@bb.count).to eq(3)
      expect(@bb.all).to eq("deep doo ditt")
    end

    it "will only append beats from a String" do
      @bb.append(:deep)

      expect(@bb.list.head).to be nil
      expect(@bb.count).to eq(0)
    end
  end

  context "#count" do
    it "can count the number of nodes" do
      @bb.append("deep doo ditt")

      expect(@bb.count).to eq(3)

      @bb.append("woo hoo shu")

      expect(@bb.count).to eq(6)
    end

    it "can count an empty LinkedList" do
      expect(@bb.count).to eq(0)
    end
    
    it "can count a single node" do
      @bb.append("deep")

      expect(@bb.count).to eq(1)
    end
  end

  context "#play" do
    it "can play beat sounds and not raise an error" do
      expect { @bb.play }.not_to raise_error
      
      @bb.append("deep doo ditt")
      
      expect { @bb.play }.not_to raise_error
    end

    it "will not play an empty LinkedList" do
      expect(@bb.play).to be nil
    end

    it "can play a multiple beats" do
      @bb.append("deep doo ditt")

      expect(@bb.play).to eq(3)
    end
  end
  
  context "#all" do
    it "can return a string of current beats" do
      @bb.append("deep doo ditt")

      expect(@bb.all).to eq("deep doo ditt")
    end

    it "can return a string of a single beat" do
      @bb.append("deep")
      
      expect(@bb.all).to eq("deep")
    end

    it "will return nothing for an empty LinkedList" do
      expect(@bb.all).to be nil
    end
  end

  context "#validate_beats" do
    it "has a list of valid beats" do
      expect(@bb.valid_beats).to eq(%w[tee dee deep bop boop la na doo ditt woo hoo shu])
    end

    it "can validate a beat" do
      expect(@bb.validate_beat("deep")).to be true
      expect(@bb.validate_beat("Mississippi")).to be false
    end

    it "will only append valid beats" do
      @bb.append("deep Mississippi")

      expect(@bb.all).to eq("deep")
    end
  end

  context "#prepend" do
    it "can prepend beats to an existing LinkedList" do
      @bb.append("deep")

      expect(@bb.all).to eq("deep")
      expect(@bb.count).to eq(1)
      
      @bb.prepend("tee tee tee")
      
      expect(@bb.all).to eq("tee tee tee deep")
      expect(@bb.count).to eq(4)
    end

    it "can prepend beats to an empty LinkedList" do
      @bb.prepend("tee tee tee")
      
      expect(@bb.all).to eq("tee tee tee")
      expect(@bb.count).to eq(3)
    end
  end

  context "playback rate" do
    it "has a default playback rate of 500" do
      expect(@bb.rate).to eq(500)
    end

    it "can change its playback rate" do
      @bb.rate = 100
      
      expect(@bb.rate).to eq(100)
    end

    it "can reset the playback rate to 500" do
      @bb.rate = 100
      
      expect(@bb.rate).to eq(100)
      
      @bb.reset_rate
      
      expect(@bb.rate).to eq(500)
    end
  end

  

  context "playback voice" do
    it "uses Boing as a default voice" do
      expect(@bb.voice).to eq("Boing")
    end

    it "can change voices" do
      @bb.voice = "Daniel"
  
      expect(@bb.voice).to eq("Daniel")
    end

    it "can reset the voice" do
      @bb.voice = "Daniel"
    
      expect(@bb.voice).to eq("Daniel")
  
      @bb.reset_voice
  
      expect(@bb.voice).to eq("Boing")
    end
  end
end