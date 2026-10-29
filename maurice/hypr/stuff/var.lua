workspaceGroupSize = 10

function workspace_in_group(i)
	local cur = hl.get_active_workspace().id
	local newVal = amth.floor((cur - 1) / workspaceGroupSize) * workspaceGroupSize + i
	return newVal
end
