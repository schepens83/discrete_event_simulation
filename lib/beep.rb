require_relative "abstracts.rb"

class Beep < Event
   def initialize(t = 0.00)
      @time = t
   end

   def execute(s = AbstractSimulator.new)
      puts "The time is #{@time}"
   end
end

class BeepSimulator < Simulator
   def initialize
      start
   end

   def start
      @events = ListQueue.new
      insert( Beep.new(4.0) )
      insert( Beep.new(1.0) )
      insert( Beep.new(1.5) )
      insert( Beep.new(2.0) )
      
      do_all_events
   end
end

BeepSimulator.new