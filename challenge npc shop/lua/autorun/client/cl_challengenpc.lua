local meta = FindMetaTable( "Player" )

local function menu()
		local localweapontable = challengenpc.config.weapons
	local voidFrame = vgui.Create("DFrame")
	voidFrame:SetSize( 560, 560 ) 
	voidFrame:SetTitle( "" )
	voidFrame:SetVisible( true ) 
	voidFrame:SetDraggable( false )
	voidFrame:ShowCloseButton( false )
	voidFrame:SetDeleteOnClose( false )
	voidFrame:MakePopup()
	voidFrame:Center()
	voidFrame.Paint = function( self, w, h )		
		draw.RoundedBox( 0, 0, 0, 560, 560, Color( 40, 40, 40, 240 ) )	
		draw.RoundedBox( 0, 0, 0, w, h - (520), Color( 33, 33, 33, 200 ) )	
		draw.RoundedBox( 0, 0, 36, w, 4, Color(110,0,178) )	 	
		draw.SimpleText( "Coding Challenge NPC", "DermaLarge", w/2, 16, Color(255,255,255), 1, 1 )		
		surface.SetDrawColor(0, 0, 0,255) 
		voidFrame:DrawOutlinedRect()							
	end	
		 
	local closeButton = vgui.Create("DButton", voidFrame)
	closeButton:SetPos(voidFrame:GetWide() - (40), 0)
	closeButton:SetSize(40,32)
	closeButton:SetText("")
	closeButton:SetTextColor( Color( 255, 255, 255 ))
	closeButton.Paint = function(self,w,h)
	if ( !self:IsHovered() ) then	
		draw.RoundedBox(0,0,0,w,h, Color( 255, 140, 250, 0) )
		draw.SimpleText("X", "CloseCaption_Bold", w/2 + 1,h/2, Color( 255, 255, 255 ), 1, 1)
		else
		draw.RoundedBox(0,0,0,w,h, Color( 135, 0, 0, 255) )
		draw.SimpleText("X", "CloseCaption_Bold", w/2 + 1,h/2, Color( 255, 255, 255 ), 1, 1)
		end
	end 
	closeButton.DoClick = function()	
		voidFrame:Remove()
	end	
local void = {}	
	void.panel = vgui.Create( "DScrollPanel", voidFrame )
	void.panel:SetSize( 560, 560 )
	void.panel:SetPos( 0, 39 )
	void.panel:DockMargin(0,11,0,10)
	void.panel:Dock(FILL)

	void.panel:GetVBar().Paint = function() return true end
	void.panel:GetVBar().btnUp.Paint = function() return true end
	void.panel:GetVBar().btnDown.Paint = function() return true end
	void.panel:GetVBar().btnGrip.Paint = function() return true end
	
	void.list = vgui.Create( "DIconLayout", void.panel)
	void.list:SetSize( 560, 570 )
	void.list:SetPos( 0, 17 )
	void.list:SetSpaceY( 10 )
 
	if localweapontable ~= nil then
		for k, v in pairs(localweapontable) do   
			void[k] = void.list:Add("DPanel")
			void[k]:SetSize( void.list:GetWide()-20, 75 )
			void[k].Paint = function( self, w, h )
				surface.SetDrawColor( 100, 100, 100, 225 )	
				surface.DrawRect( 15, 0, w-15, h  )
				surface.SetDrawColor( 33, 33, 33, 225 )	 
				surface.DrawRect( 15, 0, w-15, h  )				
				surface.SetDrawColor( 100, 100, 100, 225 )	
					surface.DrawRect( 366, 14, 50, 25  )				
				draw.RoundedBox( 0, 20, 12, 55, 55, Color( 100, 100, 100 ) )
				draw.SimpleText( v.Name, "DermaLarge", 95, 9, Color( 255, 255, 255 ), 0, 0 )
				draw.SimpleText( v.Description, "Trebuchet18", 95, 45, Color( 255, 255, 255 ), 0, 0 )		
				draw.SimpleText( "$"..v.Price, "Trebuchet18", 389, 27, Color( 255, 255, 255 ), 1, 1 )	
			end	
			void[k].model = vgui.Create( "DModelPanel", void[k] )
			void[k].model:SetSize( 60, 60 )
			void[k].model:SetPos( 15, 10 )
			void[k].model:SetModel( v.Model )
			void[k].model.LayoutEntity = function( self )
			local size1, size2 = self.Entity:GetRenderBounds()
			local size = (-size1+size2):Length()
			self:SetFOV(25)
			self:SetCamPos(Vector(size*2,size*1,size*1))
			self:SetLookAt((size1+size2)/2)
			end			
			void[k].button = vgui.Create( "DButton", void[k])
			void[k].button:SetPos( 427, 14 )
			void[k].button:SetSize( 101, 25 )
			void[k].button:SetText( "" )
			void[k].button.Paint = function( self, w, h )
				self.text = "Purchase" 
				self.color = Color(255,255,255)
			if ( self:IsHovered()) then			
				surface.SetDrawColor( 255, 255, 255, 150 )	
					surface.DrawRect( 0, 0, w, h  )
			else 
				surface.SetDrawColor( 155, 155, 155, 255 )	
					surface.DrawRect( 0, 0, w, h  )
			end
						draw.SimpleText( self.text, "Trebuchet18", w / 2, h / 2 - 1, self.color, 1, 1 )
		end 

			void[k].button.DoClick = function(self)
				net.Start("challengenpc_purchaseitem")
				net.WriteInt(k,16)
				net.SendToServer()	  
			end
		end
	end		
end
net.Receive("challengenpc_openmenu", function(len) menu() end)