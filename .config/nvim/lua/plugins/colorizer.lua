local ok, colorizer = pcall(require, "colorizer")
if not ok then
  return
end

colorizer.setup({
  "*",
}, {
  RGB = true,
  RRGGBB = true,
  names = true,
  RRGGBBAA = true,
  rgb_fn = true,
  hsl_fn = true,
  mode = "background",
})
