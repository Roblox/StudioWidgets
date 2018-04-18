----------------------------------------
--
-- LabeledRadioButton.lua
--
-- Creates a frame containing a label and a radio button.
--
----------------------------------------
GuiUtilities = require(script.Parent.GuiUtilities)
LabeledCheckbox = require(script.Parent.LabeledCheckbox)

local kButtonImage = "rbxasset://textures/TerrainTools/radio_button_frame.png"
local kBulletImage = "rbxasset://textures/TerrainTools/radio_button_bullet.png"

local kFrameSize = 12
local kBulletSize = 14

LabeledRadioButtonClass = {}
LabeledRadioButtonClass.__index = LabeledRadioButtonClass
setmetatable(LabeledRadioButtonClass, LabeledCheckbox)

function LabeledRadioButtonClass.new(nameSuffix, labelText)
	local newButton = LabeledCheckbox.new(nameSuffix, labelText, false)
	setmetatable(newButton, LabeledRadioButtonClass)

	newButton:UseSmallSize()
	newButton._checkImage.Position = UDim2.new(0.5, 0, 0.5, 0)
	newButton._checkImage.Image = kBulletImage
	newButton._checkImage.Size = UDim2.new(0, kBulletSize, 0, kBulletSize)

	newButton._button.Image = kButtonImage
	newButton._button.Size = UDim2.new(0, kFrameSize, 0, kFrameSize)
	newButton._button.BackgroundTransparency = 1

	return newButton
end

function LabeledRadioButtonClass:_SetupMouseClickHandling()
	-- We are only allowed to toggle from off to on.
	self._button.MouseButton1Down:connect(function()
		if not self._disabled then
			if (not self._value) then 
				self:SetValue(not self._value)
			end
		end
	end)
end



return LabeledRadioButtonClass