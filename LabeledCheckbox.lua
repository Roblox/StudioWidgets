----------------------------------------
--
-- LabeledCheckbox.lua
--
-- Creates a frame containing a label and a checkbox.
--
----------------------------------------
GuiUtilities = require(script.Parent.GuiUtilities)

local kCheckboxWidth = 12

local kMinTextSize = 14
local kMinHeight = 24
local kMinLabelWidth = 52
local kMinMargin = 12
local kMinButtonWidth = kCheckboxWidth;

local kMinLabelSize = UDim2.new(0, kMinLabelWidth, 0, kMinHeight)
local kMinLabelPos = UDim2.new(0, kMinButtonWidth + kMinMargin, 0, kMinHeight/2)

local kMinButtonSize = UDim2.new(0, kMinButtonWidth, 0, kMinButtonWidth)
local kMinButtonPos = UDim2.new(0, 0, 0, kMinHeight/2)

local kCheckImageWidth = 8
local kMinCheckImageWidth = kCheckImageWidth

local kCheckImageSize = UDim2.new(0, kCheckImageWidth, 0, kCheckImageWidth)
local kMinCheckImageSize = UDim2.new(0, kMinCheckImageWidth, 0, kMinCheckImageWidth)

local kEnabledCheckImage = "rbxasset://textures/TerrainTools/icon_tick.png"
local kDisabledCheckImage = "rbxasset://textures/TerrainTools/icon_tick_grey.png"
local kCheckboxFrameImage = "rbxasset://textures/TerrainTools/checkbox_square.png"
LabeledCheckboxClass = {}
LabeledCheckboxClass.__index = LabeledCheckboxClass

LabeledCheckboxClass.kMinFrameSize = UDim2.new(0, kMinLabelWidth + kMinMargin + kMinButtonWidth, 0, kMinHeight)


function LabeledCheckboxClass.new(nameSuffix, labelText, initValue, initDisabled)
	local self = {}
	setmetatable(self, LabeledCheckboxClass)

	local initValue = not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not initValue
	local initDisabled = not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not not initDisabled

	local frame = GuiUtilities.MakeStandardFixedHeightFrame("CBF" .. nameSuffix)

	local label = GuiUtilities.MakeStandardPropertyLabel(labelText)
	label.Parent = frame

	local button = Instance.new('ImageButton')
	button.Name = 'Button'
	button.Size = UDim2.new(0, kCheckboxWidth, 0, kCheckboxWidth)
	button.AnchorPoint = Vector2.new(0, .5)
	button.BackgroundTransparency = 0
	button.Position = UDim2.new(0, GuiUtilities.StandardLineElementLeftMargin, .5, 0)
	button.Parent = frame
	button.Image = kCheckboxFrameImage
	button.BorderSizePixel = 0
	button.AutoButtonColor = false
	
	local checkImage = Instance.new("ImageLabel")
	checkImage.Name = "CheckImage"
	checkImage.Parent = button
	checkImage.Image = kEnabledCheckImage
	checkImage.Visible = false
	checkImage.Size = kCheckImageSize
	checkImage.AnchorPoint = Vector2.new(0.5, 0.5)
	checkImage.Position = UDim2.new(0.5, 0, 0.5, 0)
	checkImage.BackgroundTransparency = 1
	checkImage.BorderSizePixel = 0

	self._frame = frame
	self._button = button
	self._label = label
	self._checkImage = checkImage

	self._disabled = not disabled
	self:SetDisabled(disabled)

	self._value = not initValue
	self:SetValue(initValue)

	self:_SetupMouseClickHandling()

	return self
end


function LabeledCheckboxClass:_SetupMouseClickHandling()
	self._button.MouseButton1Down:connect(function()
		if not self._disabled then
			self:SetValue(not self._value)
		end
	end)
end

-- Small checkboxes are a different entity.
-- All the bits are smaller.
-- Fixed width instead of flood-fill.
-- Box comes first, then label.
function LabeledCheckboxClass:UseSmallSize()
	self._label.TextSize = kMinTextSize
	self._label.Size = kMinLabelSize
	self._label.Position = kMinLabelPos
	self._label.TextXAlignment = Enum.TextXAlignment.Left

	self._button.Size = kMinButtonSize    
	self._button.Position = kMinButtonPos

	self._checkImage.Size = kMinCheckImageSize

	self._frame.Size = LabeledCheckboxClass.kMinFrameSize
	self._frame.BackgroundTransparency = 1
end

function LabeledCheckboxClass:GetFrame()
	return self._frame
end

function LabeledCheckboxClass:GetValue()
	return self._value
end

function LabeledCheckboxClass:GetLabel()
	return self._label
end

function LabeledCheckboxClass:GetButton()
	return self._getButton
end

function LabeledCheckboxClass:SetValueChangedFunction(vcFunction) 
	self._valueChangedFunction = vcFunction
end

function LabeledCheckboxClass:SetDisabled(newDisabled)
	local newDisabled = not not newDisabled
	if newDisabled ~= self._disabled then
		self._disabled = newDisabled

		if (newDisabled) then 
			self._checkImage.Image = kDisabledCheckImage
		else
			self._checkImage.Image = kEnabledCheckImage
		end

		self._label.TextColor3 = self._disabled and GuiUtilities.kDisabledTextColor or GuiUtilities.kStandardTextColor
		self._button.BackgroundColor3 = self._disabled and GuiUtilities.kButtonDisabledBackgroundColor or GuiUtilities.kButtonStandardBackgroundColor
		self._button.BorderColor3 = self._disabled and GuiUtilities.kButtonDisabledBorderColor or GuiUtilities.kButtonStandardBorderColor
		if self._disabledChangedFunction then
			self._disabledChangedFunction(self._disabled)
		end
	end
end

function LabeledCheckboxClass:GetDisabled()
	return self._disabled
end

function LabeledCheckboxClass:SetValue(newValue)
	local newValue = not not newValue
	
	if newValue ~= self._value then
		self._value = newValue

		self._checkImage.Visible = self._value

		if (self._valueChangedFunction) then 
			self._valueChangedFunction(newValue)
		end
	end
end

return LabeledCheckboxClass