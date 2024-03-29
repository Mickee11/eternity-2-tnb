SWEP.CSModels = {}

-- Cleans up any CS models attached to the entity
function SWEP:RemoveManagedCSModels()
	for _, v in pairs(self.CSModels) do
		if IsValid(v) then
			v:Remove()
		end
	end
end

-- Attaches a CS model to the entity, cleaning it up when we remove the weapon
function SWEP:CreateManagedCSModel(mdl, rendergroup)
	local ent = ClientsideModel(mdl, rendergroup or RENDERGROUP_OTHER)

	table.insert(self.CSModels, ent)

	return ent
end

-- Sets up our custom VM
function SWEP:SetupCustomVM(mdl)
	if IsValid(self.VM) then
		self.VM:Remove()
	end

	if IsValid(self.HandsTranslate) then
		self.HandsTranslate:Remove()
	end

	self.VM = self:CreateManagedCSModel(mdl, RENDERGROUP_BOTH)
	self.VM:SetNoDraw(true)
	self.VM:SetupBones()
	self.VM.ParentWeapon = self

	if self.VM:LookupBone("R ForeTwist") and not self.VM:LookupBone("ValveBiped.Bip01_R_Hand") then
		self.HandsTranslate = self:CreateManagedCSModel("models/weapons/tfa_ins2/c_ins2_pmhands.mdl", RENDERGROUP_BOTH)
		self.HandsTranslate:SetNoDraw(true)
		self.HandsTranslate:SetupBones()

		self.HandsTranslate:SetParent(self.VM)
		self.HandsTranslate:SetPos(self.VM:GetPos())
		self.HandsTranslate:SetAngles(self.VM:GetAngles())
		self.HandsTranslate:AddEffects(EF_BONEMERGE)
		self.HandsTranslate:AddEffects(EF_BONEMERGE_FASTCULL)
	end

	self:SetupVMMaterials()

	-- Inverting the model itself
	if self.ViewModelFlip then
		local matrix = Matrix()

		matrix:Scale(Vector(1, -1, 1))

		self.VM:EnableMatrix("RenderMultiply", matrix)
	end
end

function SWEP:SetupVMMaterials()
	local vm = self.VM

	if not IsValid(vm) then
		return
	end

	if istable(self.VMSubMaterials) then
		for k, v in pairs(self.VMSubMaterials) do
			if not isnumber(k) then
				continue
			end

			if isstring(v) then
				vm:SetSubMaterial(k, v)
			else
				vm:SetSubMaterial(k, "null")
			end
		end
	else
		vm:SetMaterial(self.VMSubMaterials)
	end

	for k, v in pairs(self.VMBodyGroups) do
		if not isnumber(k) then
			continue
		end

		vm:SetBodygroup(k, v)
	end
end

-- Actually draws the custom VM
function SWEP:DrawVM()
	if self.ViewModelFlip then
		render.CullMode(MATERIAL_CULLMODE_CW)
	end

	self.VM:FrameAdvance(FrameTime())
	self.VM:SetupBones()
	self.VM:DrawModel()

	-- Drawing hands
	if self.UseHands then
		self:HandleHands()
	end

	if self.ModelSkin then
		self.VM:SetSkin(self.ModelSkin)
	end

	render.CullMode(MATERIAL_CULLMODE_CCW)
end

function SWEP:HandleHands()
	local ply = self.Owner
	local vm = self.VM

	if IsValid(self.HandsTranslate) then
		vm = self.HandsTranslate

		vm:SetupBones()
	end

	local hands = ply:GetHands()

	if IsValid(hands) then
		if hands:GetParent() != vm then
			hands:AttachToViewmodel(vm)
		end

		hands:SetupBones()
		hands:DrawModel()
	end
end

-- Handles drawing the viewmodel and any attached extras
function SWEP:PostDrawViewModel()
	if LocalPlayer() != self.Owner then
		return
	end

	if not IsValid(self.VM) then
		self:SetupModel()
	end

	self:HandleVMOffsets()
	self:ApplyVMOffsets()
	self:DrawVM()
end
