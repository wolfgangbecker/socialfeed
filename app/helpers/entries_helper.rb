module EntriesHelper
	def read_link entry
		link_to entry.read, entry_path(entry, params: {entry: {read: !entry.object.read}}), method: :put, :remote => true, data: {type: :json}, class: 'js-read-link'
	end

	def favorite_link entry
		link_to entry_path(entry, params: {entry: {favorite: !entry.object.favorite}}), method: :put do
			content_tag(:div, 'c', class: "icon pull-right #{'favorited' if entry.favorite?}")
		end
	end

	def read? entry
		'read' if entry.read?
	end
end
