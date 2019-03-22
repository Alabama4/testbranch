ENT.Base = "base_ai" 
ENT.Type = "ai"
ENT.PrintName = "TestNPC"
ENT.Author = "Alabama"
ENT.Category = "TestNPC"
ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.AutomaticFrameAdvance = true

function ENT:SetAutomaticFrameAdvance( bUsingAnim )
	self.AutomaticFrameAdvance = bUsingAnim
end
 