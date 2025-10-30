--[[
Fuzzy finder
Docs: https://github.com/nvim-telescope/telescope-fzf-native.nvim

Performance depends on installation of ripgrep and fd (both available in Homebrew)
If you have huge amounts of files, consider adding some to `$HOME/.ignore`:
  Pictures/
  Music/
  Applications/
  dotnet/
  opt/miniconda3/
  Library/
  .cache/
  .git/
]]--
return {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
}
