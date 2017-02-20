require_relative "abstracts.rb"

class Counter < Event
	def initialize(t = 0.00)
		@time = t		
	end

	def execute(s = AbstractSimulator.new)
		puts "The time is #{@time}"
		if @time < 10
			@time += 2.0
			s.insert(self)
		end
	end
end

class CounterSimulator < Simulator
	def initialize
		start
	end

	def start
		@events = ListQueue.new
      insert( Counter.new(0.0) )
      do_all_events
	end
end

CounterSimulator.new