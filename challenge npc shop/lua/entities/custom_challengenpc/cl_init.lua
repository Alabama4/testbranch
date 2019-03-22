include("shared.lua")

surface.CreateFont( "ah_font", {
	font = "Segoe UI Semillight", 
	size = 25,
	weight = 800,
	antialias = true,
} )

function ENT:Draw()

	self:DrawModel()
	
	local dist = self:GetPos():Distance(EyePos())
	local clam = math.Clamp(dist, 0, 255 )
	local main = (255 - clam)
	
	if (main <= 0) then return end
	
	local ahAngle = self:GetAngles()
	local AhEyes = LocalPlayer():EyeAngles()
	local colr = Color(255,255,255)
	ahAngle:RotateAroundAxis(ahAngle:Forward(), 90)
	ahAngle:RotateAroundAxis(ahAngle:Right(), -90)		
	
	cam.Start3D2D(self:GetPos()+self:GetUp()*80, Angle(0, AhEyes.y-90, 90), 0.175)
	
		draw.RoundedBox(0,-140,10,280,34,Color(0, 0, 0, main))
		surface.SetDrawColor( Color(255,255,255) )
		surface.DrawOutlinedRect( -140,10,280,34 )
		draw.SimpleTextOutlined("Challenge NPC Shop", "ah_font", 0, 13, Color(255,255,255), 1, 0, 1, Color(25, 25, 25, main))
		
	cam.End3D2D()	
	
end		
 





 