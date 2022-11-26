-- import nvim-autopairs safely
local setup, flutter = pcall(require, "flutter-tools")
if not setup then
  return
end

flutter.setup()
