local vim = vim
local util = {}

-- モジュールが存在しているかどうかの判定
util.isModuleAvailable = function(strModuleName)
	if package.loaded[strModuleName] then
		return true
	else
		for _, searcher in ipairs(package.searchers or package.loaders) do
			local loader = searcher(strModuleName)
			if type(loader) == 'function' then
				package.preload[strModuleName] = loader
				return true
			end
		end
	end
	return false
end

util.map = function(func, seq)
	local result = {}
	for _, v in ipairs(seq) do table.insert(result, func(v)) end

	return result
end

util.entriesMap = function (func, seq)
	local result = {}
	for k, v in ipairs(seq) do
		table.insert(result, func(k, v))
	end
	return result
end

---@ArakiTakaki
---@param filetype string   filetypeの識別子の指定
---@param indent   number   indentのサイズの指定
---@param isEt     boolean  tabをスペースに変換するかどうか
util.setIndent = function(filetype, indent, isEt)
	local result = {
		'autocmd', 'FileType', filetype, 'setlocal', 'sw=' .. indent, -- softtabstop
		'sts=' .. indent, -- shiftwidth
		'ts=' .. indent, -- tabstop
		isEt and 'et' or '' -- indent to space
	}
	local result = table.concat(result, ' ')
	vim.cmd(result)
end

---@ArakiTakaki
---@meta 三項演算子
---@param bool boolean filetypeの識別子の指定
---@param a    any     値A
---@param b    any     値B
---@return     any
util.ternary = function(bool, a, b) return ((not bool or (bool and a)) and b) end

return util
