----------------------------------------
--
-- ImageButtonWithText.lua
--
-- An image button with text underneath.  Standardized hover, clicked, and 
-- selected states.
--
----------------------------------------
GuiUtilities = require(script.Parent.GuiUtilities)

ImageButtonWithTextClass = {}
ImageButtonWithTextClass.__index = ImageButtonWithTextClass

local kSelectedBaseTransparency = 0.85

function ImageButtonWithTextClass.new(name, 
		layoutOrder, 
		icon, 
		text, 
		buttonSize,
		imageSize, 
		imagePos, 
		textSize, 
		textPos)
	local self = {}
	setmetatable(self, ImageButtonWithTextClass)

	local button = Instance.new("ImageButton")
	button.Name = name
	button.AutoButtonColor = false
	button.Size = buttonSize
	button.BorderSizePixel = 1
	-- Image-with-text button has translucent background and "selected" background color.
	-- When selected we set transluency to not-zero so we see selected color.
	button.BackgroundTransparency = 1 
	button.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)

	button.LayoutOrder = layoutOrder

	local buttonIcon = Instance.new("ImageLabel")
	buttonIcon.BackgroundTransparency = 1
	buttonIcon.Image = icon or ""
	buttonIcon.Size = imageSize
	buttonIcon.Position = imagePos
	buttonIcon.Parent = button

	local textLabel = Instance.new("TextLabel")
	textLabel.BackgroundTransparency = 1
	textLabel.Text = text
	textLabel.Size = textSize
	textLabel.Position = textPos
	textLabel.TextScaled = true
	textLabel.Font = Enum.Font.SourceSans
	textLabel.Parent = button

	local uiTextSizeConstraint = Instance.new("UITextSizeConstraint")
	-- Spec asks for fontsize of 12 pixels, but in Roblox the text font sizes look smaller than the mock
	--Note: For this font the Roblox text size is 25.7% larger than the design spec. 
	uiTextSizeConstraint.MaxTextSize = 15		                                          
	uiTextSizeConstraint.Parent = textLabel

	self._button = button
	self._clicked = false
	self._hovered = false
	self._selected = false

	button.InputBegan:connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseMovement) then               
			self._hovered = true
			self:_updateButtonVisual()
		end
	end)


	button.InputEnded:connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseMovement) then               
			self._hovered = false
			self._clicked = false
			self:_updateButtonVisual()
		end
	end)    

	button.MouseButton1Down:connect(function()
		self._clicked = true
		self:_updateButtonVisual()
	end)

	button.MouseButton1Up:connect(function()
		self._clicked = false
		self:_updateButtonVisual()
	end)
	
	self:_updateButtonVisual()

	return self
end

function ImageButtonWithTextClass:_updateButtonVisual()
	local base = self._selected and kSelectedBaseTransparency or 1
	if (self._clicked) then 
		self._button.BackgroundTransparency = base - 0.2
	elseif (self._hovered) then 
		self._button.BackgroundTransparency = base - 0.1
	else
		self._button.BackgroundTransparency = base
	end
end

function ImageButtonWithTextClass:getButton()
	return self._button
end

function ImageButtonWithTextClass:setSelected(selected)
	self._selected = selected
	self:_updateButtonVisual()
end
 
function ImageButtonWithTextClass:getSelected()
	return self._selected
end


return ImageButtonWithTextClass