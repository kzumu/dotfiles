local function mousePress(eventobj)

  if eventobj:getButtonState(4) then
    hs.eventtap.event.newKeyEvent({'cmd'}, ']', true):post()
    hs.eventtap.event.newKeyEvent({'cmd'}, ']', false):post()
  end

  if eventobj:getButtonState(3) then
    hs.eventtap.event.newKeyEvent({'cmd'}, '[', true):post()
    hs.eventtap.event.newKeyEvent({'cmd'}, '[', false):post()
  end

  return false
end

hs.eventtap.new({25}, mousePress):start()

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  hs.alert.show("cmd alt ctrl")
end)

hs.eventtap.new({hs.eventtap.event.types.flagsChanged}, function(e)
  local flags = e:getFlags()
  if flags.cmd and not (flags.alt or flags.shift or flags.ctrl or flags.fn) then
      local keyCode = e:getKeyCode()
      if keyCode == 0x37 then
          hs.eventtap.event.newKeyEvent({'shift', 'ctrl'}, ';', true):post()
      elseif keyCode == 0x36 then
          hs.eventtap.event.newKeyEvent({'shift', 'ctrl'}, 'J', true):post()
      end
  end    
end):start()