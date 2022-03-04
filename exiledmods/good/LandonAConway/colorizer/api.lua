colorizer.registered_crafts = {}

function colorizer.register_craft(def)
  if type(def.input) ~= "string" then error("string expected") end
  if type(def.output) ~= "string" then error("string expected") end
  
  def.ink_usage = def.ink_usage or {}
  def.ink_usage.magenta = def.ink_usage.magenta or 0
  def.ink_usage.yellow = def.ink_usage.yellow or 0
  def.ink_usage.cyan = def.ink_usage.cyan or 0
  def.ink_usage.white = def.ink_usage.white or 0
  def.ink_usage.black = def.ink_usage.black or 0
  
  for ink_name, ink in pairs(def.ink_usage) do
    if ink > 1 then
      ink = 1
    elseif ink < 0 then
      ink = 0
    end
  end
  
  colorizer.registered_crafts[def.input] =  colorizer.registered_crafts[def.input] or {}
  colorizer.registered_crafts[def.input][def.output] = def
end