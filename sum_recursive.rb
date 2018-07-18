def sum(e)
	if e < 1
		return e
	else
		return sum(e-1) + e
	end
end

p sum(5)