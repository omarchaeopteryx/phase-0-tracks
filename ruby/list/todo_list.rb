class TodoList
	def initialize(list)
		@list = list
		#list = Array.new
	end

	def get_items
		@list
	end

	def add_item(item)
		@list << item
	end

	def delete_item(item)
		@list.delete(item)
	end

	def get_item(index)
		item = @list[index]
		return item
	end
end

# list = TodoList.new(["do the dishes", "mow the lawn"])
# p list
# list.delete_item(["do the dishes"])
# p list
