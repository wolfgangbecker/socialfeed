module EntriesHelper
	def read_link entry
		link_to entry.read, entry_path(entry, params: {entry: {read: !entry.object.read}}), method: :put, :remote => true
	end

	def favorite_link entry
		link_to entry_path(entry, params: {entry: {favorite: !entry.object.favorite}}), method: :put, :remote => true do
			content_tag(:div, 'c', class: "icon pull-right #{'favorited' if entry.favorite?}")
		end
	end

	def read? entry
		'read' if entry.object.read?
	end

	def truncated_name_with_tooltip name, length
		if name.size > length
			content_tag(:span, truncate(name, length: length), title: name, data: {toggle: "tooltip", placement: "bottom"})
		else
			content_tag(:span, name)
		end
	end
end
