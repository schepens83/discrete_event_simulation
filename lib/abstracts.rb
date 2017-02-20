class Comparabel
	def less_than(y = Comparabel.new(0))

	end
end

class AbstractEvent < Comparabel
  # execute with abstractSimulator as input
  def execute(s = AbstractSimulator.new)
  end
end

class Event < AbstractEvent
	attr_accessor :time

	def initialize(time = 0.00)
		@time = time
	end

	def less_than(y = Comparabel.new)
		time < y.time
	end
end


class AbstractSimulator
	# events is an ordered_set type
	attr_accessor :events

	# insert an abstractevent
	def insert(e = AbstractEvent.new)
		events.insert(e)
	end

	def cancel(e = AbstractEvent.new)
		raise NotImplementedError
	end
end

class Simulator < AbstractSimulator
	attr_reader :time

	def initialize
		@time = 0
	end

	def now
		time
	end

	def do_all_events
		e = Event.new
		while (e = events.remove_first) != nil
			@time = e.time
			e.execute(self)
		end


	end

end


class OrderedSet
	attr_accessor :size

  # insert comparable
  def insert
  end
  
  # remove first comparable
  def remove_first
  end

  # remove comparable
  def remove
  end

end

class ListQueue < OrderedSet
	def initialize
		@elements = Array.new
	end

	def insert(x = Comparabel.new)
		i = 0

		while i < @elements.size && @elements[i].less_than(x)
			i += 1
		end
		@elements.insert(i, x)
	end

	def remove_first
		return nil if @elements.length == 0 
		@elements.shift
	end

	def remove(x = Comparabel.new)
		@elements.delete(x)
	end

	def size
		elements.length
	end
end
