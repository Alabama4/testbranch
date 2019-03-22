util.AddNetworkString("challengenpc_openmenu")
util.AddNetworkString("challengenpc_purchaseitem")
local meta = FindMetaTable( "Player" ) 
 



net.Receive("challengenpc_purchaseitem",function(_,ply)
local int = net.ReadInt(16)
if !ply:canAfford(challengenpc.config.weapons[int].Price) then return DarkRP.notify(ply,1,4,"You cannot afford this!") end
	DarkRP.notify(ply,0,4,"You have sucessfully Purchased your " .. challengenpc.config.weapons[int].Name .. "!")
	ply:addMoney(-challengenpc.config.weapons[int].Price)
	challengenpc.config.weapons[int].buyfunction(ply)
	
end)

	concommand.Add("custom_spawnpermanpc",function(ply,cmd,args) 

		if ply:IsSuperAdmin() then
		custom_codingchallengenpc(ply)
	end

		end) 

function custom_codingchallengenpc(ply)
local spawn = ply:GetEyeTrace().HitPos
local dealer = ents.Create("custom_challengenpc")
dealer:SetPos(spawn)
dealer:SetModel(challengenpc.config.model)
dealer:Spawn() 
end 
 