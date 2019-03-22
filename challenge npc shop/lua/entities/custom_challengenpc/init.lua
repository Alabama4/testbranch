AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")


function ENT:Initialize( )

	self:SetHullType( HULL_HUMAN );
	self:SetHullSizeNormal();
	self:SetSolid( SOLID_BBOX ) 
	self:SetMoveType( MOVETYPE_STEP )
	self:CapabilitiesAdd( CAP_MOVE_GROUND &&  CAP_OPEN_DOORS && CAP_ANIMATEDFACE && CAP_TURN_HEAD && CAP_USE_SHOT_REGULATOR && CAP_AIM_GUN )
	self:SetMaxYawSpeed( 5000 )
	self:SetUseType(SIMPLE_USE)

 
end     


   function ENT:AcceptInput( key, ply )	
if ( key == "Use" && ply:IsPlayer() && IsValid( ply ) ) then	
	net.Start("challengenpc_openmenu")
	net.Send(ply) 
end 
end  