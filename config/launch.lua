local platform = require("utils.platform")()

local options = {
  default_prog = {},
  launch_menu = {},
}

if platform.is_win then
  options.default_prog = { "pwsh" }
  options.launch_menu = {
    { label = "󰨊 PowerShell Desktop", args = { "powershell" } },
    { label = " PowerShell Core", args = { "pwsh" } },
    { label = " Command Prompt", args = { "cmd" } },
    { label = " Nushell", args = { "nu" } },
    {
      label = "󰊢 Git-Bash",
      -- args = { "C:\\Program Files\\Git\\bin\\bash.exe" },  会出现中文乱码
      args = { "C:\\Program Files\\Git\\bin\\bash.exe", "--login" }
    },
    {
      label = " WSL(Debian)",
      args = { "wsl.exe", "-d", "Debian" },
    },
    {
      label = " WSL(Kali)",
      args = { "wsl.exe", "-d", "kali-linux" },
    },
    {
      label = " WSL(Ubuntu)",
      args = { "wsl.exe", "-d", "Ubuntu", "--exec", "fish", "-l" },
    },
    {
      label = "󰣀 ssh to AlmaLinux",
      args = { "ssh", "kali@192.168.44.147", "-p", "22" },
    },
  }
elseif platform.is_mac then
  options.default_prog = { 'zsh', '-l' }
  options.launch_menu = {
    { label = " Zsh", args = { "zsh", "-l"  } },
    { label = "󱆃 Bash", args = { "bash", "-l"  } },
    { label = " Fish", args = { "/opt/homebrew/bin/fish", "-l" } },
    { label = " Nushell", args = { "/opt/homebrew/bin/nu", "-l" } },
  }
elseif platform.is_linux then
  options.default_prog = { 'zsh', '-l' }
  options.launch_menu = {
     { label = ' Zsh', args = { 'zsh', '-l' } },
     { label = '󱆃 Bash', args = { 'bash', '-l' } },
     { label = ' Fish', args = { 'fish', '-l' } },
     { label = " Nushell", args = { "nu", "-l" } },
  }
end

return options
