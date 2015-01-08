module EntriesHelper
	def read_link entry
		link_to entry.read, entry_path(entry, params: {entry: {read: !entry.object.read}}), method: :put
	end

	def read? entry
		entry.read?? 'read' : 'unread'
	end
end
