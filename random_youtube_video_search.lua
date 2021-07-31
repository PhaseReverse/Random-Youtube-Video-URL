request = require "http.request"

--CHECK IF URL IS VALID, IF VALID PRINT TO THE TERMINAL
function check_url(url)
    headers, stream = request.new_from_uri(url):go()
    body = stream:get_body_as_string()
    if headers:get ":status" ~= "200" then error(body) end
    if body:find("Video unavailable") ~= nil then
--        print(url) --invalid
    else
        print(url) --valid
    end
    return nil
end

--BASE64 CHARACTERS USED IN VIDEO URL OF YOUTUBE
b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_'
l = #b
url = 'https://www.youtube.com/watch?v='
math.randomseed(os.time())

while true do
    s = ''
    for i = 1, 11 do
        r = math.random(1, l)
        s = s .. string.sub(b, r, r)
    end

    check_url(url..s)
end
