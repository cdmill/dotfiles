local M = {}

---@package
---@return boolean
function M.cwd_is_git_repo()
    local cmd = { "git", "rev-parse", "--is-inside-git-dir" }
    local result = vim.system(cmd):wait()
    return result.code == 0
end

---@package
---@return boolean
function M.git_has_local_changes()
    local cmd = { "git", "status", "--porcelain" }
    local result = vim.system(cmd):wait()
    return result.stdout and #result.stdout > 0
end

function M.show_diff()
    return M.cwd_is_git_repo() and M.git_has_local_changes()
end

---Convenient new file prompt expansion for startup screen
---@return nil
function M.new_file_prompt()
    local inp = vim.fn.input("Name: ")
    vim.cmd(("New %s"):format(inp))
end

return M
