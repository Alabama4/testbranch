if not challengenpc then 
	challengenpc = {}
end

challengenpc.config = {}

challengenpc.config.model = "models/player/group01/male_06.mdl" 

challengenpc.config.weapons = {
[1] = {
		Name = "+ 50 Health", 
		Model = "models/weapons/w_medkit.mdl",
		Description = "Gives you + 50 Health",
		Price = 1000,
		buyfunction = function(ply) ply:SetHealth(ply:Health() + 50 ) end
	},
[2] = {
		Name = "+ 50 Armor", 
		Model = "models/weapons/w_medkit.mdl",
		Description = "Gives you + 50 Armor",
		Price = 1000,
		buyfunction = function(ply) ply:SetArmor(ply:Armor() + 50 ) end
	},


}  