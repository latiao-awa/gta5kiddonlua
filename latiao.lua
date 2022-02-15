-- By:latiao QQ：3497780275 Web:latiaoawa.cf
local function tp()
    local position = localplayer:get_position()
    position.z = position.z - 1000
    localplayer:set_position(position)
end
local function TpNpcvoid()
    local position = localplayer:get_position()
    position.z = position.z - 1000
    for p in replayinterface.get_peds() do
        if p == localplayer then
            goto continue
        end
        if p:is_in_vehicle() then
            goto continue
        end
        p:set_position(position)
        ::continue::
    end
end
local function TpNpcNone()
    for p in replayinterface.get_peds() do
        if p == localplayer then
            goto continue
        end
        if p:is_in_vehicle() then
            goto continue
        end
        p:set_position(9999, 9999, -100)
        ::continue::
    end
end
local function TpNpcMe()
    local position = localplayer:get_position()
    position.z = position.z + 2
    for p in replayinterface.get_peds() do
        if p == localplayer then
            goto continue
        end
        if p:is_in_vehicle() then
            goto continue
        end
        p:set_position(position)
        ::continue::
    end
end
local function TpNpcMeKillOn()
    local position = localplayer:get_position()
    for p in replayinterface.get_peds() do
        if p == localplayer then
            goto continue
        end
        if p:is_in_vehicle() then
            goto continue
        end
        p:set_position(position)
        p:set_max_health(150)
        p:set_health(99)
        ::continue::
    end
end
local function TpBadNpcMeKillOn()
    local position = localplayer:get_position()
    position.z = position.z + 5
    for p in replayinterface.get_peds() do
        if p == localplayer then
            goto continue
        end
        if p:is_in_vehicle() then
            goto continue
        end
        p:set_position(position)
        menu.kill_all_enemies()
        ::continue::
    end
end
local function TpBadNpcMeKillUp()
    local position = localplayer:get_position()
    position.z = position.z + -10
    for p in replayinterface.get_peds() do
        if p == localplayer then
            goto continue
        end
        if p:is_in_vehicle() then
            goto continue
        end
        p:set_position(position)
        menu.kill_all_enemies()
        ::continue::
    end
end
local function freeze()
    for p in replayinterface.get_peds() do
        if p == localplayer then
            goto continue
        end
        p:set_freeze_momentum(true)
        ::continue::
    end
end
local function unfreeze()
    for p in replayinterface.get_peds() do
        if p == localplayer then
            goto continue
        end
        p:set_freeze_momentum(false)
        ::continue::
    end
end
local function killnpc()
    for p in replayinterface.get_peds() do
        if p == localplayer then
            goto continue
        end
        if p:get_health() < 99 then
            goto continue
        end
        p:set_max_health(150)
        p:set_health(99)
        ::continue::
    end
end
local function npcheal()
    for p in replayinterface.get_peds() do
        if p == localplayer then
            goto continue
        end
        p:set_max_health(150)
        p:set_health(150)
        ::continue::
    end
end
local function set1heal()
    for p in replayinterface.get_peds() do
        if p == localplayer then
            goto continue
        end
        if p:get_health() < 99 then
            goto continue
        end
        p:set_max_health(150)
        p:set_health(100)
        ::continue::
    end
end
local function allnpcgodmod()
    local position = localplayer:get_position()
    for p in replayinterface.get_peds() do
        p:set_godmode(true)
    end
end
local function allnpcgodmodfalse()
    local position = localplayer:get_position()
    for p in replayinterface.get_peds() do
        p:set_godmode(false)
    end
end
local function freezeplayer()
    localplayer:set_freeze_momentum(true)
end
local function unfreezeplayer()
        localplayer:set_freeze_momentum(false)
end
local function tpcheme()
    local position = localplayer:get_position()
    position.y = position.y + 1
    for p in replayinterface.get_vehicles() do
        p:set_position(position)
    end
end
local function tpchenpc1000()
    for c in replayinterface.get_vehicles() do
    for p in replayinterface.get_peds() do
        if p == localplayer then
            goto continue
        end
        c:set_position(9999, 9999, -100)
        p:set_position(9999, 9999, -100)
        ::continue::
    end
end
end
local function tppickups()
    local position = localplayer:get_position()
    position.z = position.z + 1
    for p in replayinterface.get_pickups() do
        p:set_position(position)
        ::continue::
    end
end
local function chefly()
    for p in replayinterface.get_vehicles() do
        p:set_gravity(-100)
    end
end
local function tpchemebom()
    local position = localplayer:get_position()
    position.z = position.z - 0
    for p in replayinterface.get_vehicles() do
        p:set_position(position)
        p:set_health(-1)
        p:set_gravity(0)
    end
end
menu.add_action("传送npc到世界边界", TpNpcNone)
menu.add_action("传送npc到我", TpNpcMe)
menu.add_action("传送所有npc到我并杀死上", TpNpcMeKillOn)
menu.add_action("传送所有敌人npc到我并杀死上", TpBadNpcMeKillOn)
menu.add_action("传送所有敌人npc到我并杀死下", TpBadNpcMeKillUp)
menu.add_action("传送npc到虚空", TpNpcvoid)
menu.add_action("冻结npc", freeze)
menu.add_action("取消冻结npc", unfreeze)
menu.add_action("杀死所有npc", killnpc)
menu.add_action("复活所有npc(测试)", npcheal)
menu.add_action("z轴-1000", tp)
menu.add_action("所有npc只有1滴血", set1heal)
menu.add_action("所有生物无敌", allnpcgodmod)
menu.add_action("所有生物取消无敌", allnpcgodmodfalse)
menu.add_action("冻结自己", freezeplayer)
menu.add_action("取消冻结自己", unfreezeplayer)
menu.add_action("传送所有车到自己", tpcheme)
menu.add_action("所有可拾取物品传送到我(测试)", tppickups)
menu.add_action("所有车飞天", chefly)
menu.add_action("传送所有车到自己+爆炸", tpchemebom)
menu.add_action("传送所有车+人到世界边界", tpchenpc1000)