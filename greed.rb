# greedy algorithms 

states_needed = ['mt', 'wa','or', 'id', 'nv', 'ut', 'ca', 'az']
stations = { 
	kone: ['id', 'nv', 'ut'], 
	ktwo: ['wa', 'id', 'mt'],
	kthree: ['or', 'nv', 'ca'],
	kfour: ['nv', 'ut'],
	kfive: ['ca', 'az']
}

final_stations = []

while states_needed.size > 0
	best_station = nil
	states_covered = []

	# this is only gonna choose one 'best station'
	# for this particular set

	# n + (n-1) + n - 2 + n - 3 => N^2 (until no more states are needed)
	stations.each do |station, states_for_stations|
		# get the intersection between the
		# state on that particular station and the ones needed
		covered = states_needed & states_for_stations

		if covered.size > states_covered.size
			best_station = station
			states_covered = covered
		end
	end

	states_needed -= states_covered
	final_stations << best_station
end

p final_stations
