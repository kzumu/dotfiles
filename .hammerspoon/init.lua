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

--- === UnsplashZ ===
---
--- Use unsplash images as wallpaper
---
--- Download: [https://github.com/Hammerspoon/Spoons/raw/master/Spoons/UnsplashZ.spoon.zip](https://github.com/Hammerspoon/Spoons/raw/master/Spoons/UnsplashZ.spoon.zip)

local obj={}
obj.__index = obj

-- Metadata
obj.name = "UnsplashZ"
obj.version = "1.0"
obj.author = "ashfinal <ashfinal@gmail.com>"
obj.homepage = "https://github.com/Hammerspoon/Spoons"
obj.license = "MIT - https://opensource.org/licenses/MIT"

local function curl_callback(exitCode, stdOut, stdErr)
    if exitCode == 0 then
        obj.task = nil
        obj.last_pic = hs.http.urlParts(obj.pic_url).lastPathComponent
        local localpath = os.getenv("HOME") .. "/.Trash/" .. hs.http.urlParts(obj.pic_url).lastPathComponent

        local screens = hs.screen.allScreens()
        for i, screen in ipairs(screens) do
          screen:desktopImageURL("file://" .. localpath)
        end
    else
        print(stdOut, stdErr)
    end
end

local function unsplashRequest()
    local user_agent_str = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.1.1 Safari/603.2.4"
    obj.pic_url = hs.execute([[ /usr/bin/curl 'https://source.unsplash.com/3000x2000/?coast' --insecure |  perl -ne ' print "$1" if /href="([^"]+)"/ ' ]])
    if obj.last_pic ~= obj.pic_url then
        if obj.task then
            obj.task:terminate()
            obj.task = nil
        end
        local localpath = os.getenv("HOME") .. "/.Trash/" .. hs.http.urlParts(obj.pic_url).lastPathComponent
        obj.task = hs.task.new("/usr/bin/curl", curl_callback, {"-A", user_agent_str, obj.pic_url, "-o", localpath})
        obj.task:start()
    end
end

hs.timer.doEvery(2*60*60, function() unsplashRequest() end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  hs.alert.show("Get wallpaper from source.unsplash.com/3000x2000/?coast")
  unsplashRequest()
end)

-- hs.eventtap.new({hs.eventtap.event.types.flagsChanged}, function(e)
--   local flags = e:getFlags()
--   if flags.cmd and not (flags.alt or flags.shift or flags.ctrl or flags.fn) then
--       local keyCode = e:getKeyCode()
--       if keyCode == 0x37 then
--           hs.eventtap.event.newKeyEvent({'shift', 'ctrl'}, ';', true):post()
--       elseif keyCode == 0x36 then
--           hs.eventtap.event.newKeyEvent({'shift', 'ctrl'}, 'J', true):post()
--       end
--   end
-- end):start()
