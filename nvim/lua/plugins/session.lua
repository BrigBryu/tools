return {
  "rmagatti/auto-session",
  event = "BufReadPre",
  opts = {
    auto_session_enabled        = true,
    auto_session_use_git_branch = true,
    auto_session_root_dir       = vim.fn.stdpath("data") .. "/sessions/",
  },
}
