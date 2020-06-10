----------------------------------------
--
-- VerticalScrollingFrame.lua
--
-- Creates a scrolling frame that automatically updates canvas size
--
----------------------------------------

local GuiUtilities = require(script.Parent.GuiUtilities)

local VerticalScrollingFrame = {}
VerticalScrollingFrame.__index = VerticalScrollingFrame

function VerticalScrollingFrame.new(suffix)
	local self = {}
	setmetatable(self, VerticalScrollingFrame)
	
	local section = Instance.new("Frame")
	section.BorderSizePixel = 0
	section.Size = UDim2.new(1, 0, 1, 0)
	section.Position = UDim2.new(0, 0, 0, 0)
	section.BackgroundTransparency = 1
	section.Name = "VerticalScrollFrame" .. suffix
	
	local scrollBackground = Instance.new("Frame")
	scrollBackground.Name = "ScrollbarBackground"
	scrollBackground.BackgroundColor3 = Color3.fromRGB(238, 238, 238)
	scrollBackground.BorderColor3 = Color3.fromRGB(182, 182, 182)
	scrollBackground.Size = UDim2.new(0, 15, 1, -2)
	scrollBackground.Position = UDim2.new(1, -16, 0, 1)
	scrollBackground.Parent = section
	scrollBackground.ZIndex = 2;
	
	local scrollFrame = Instance.new("ScrollingFrame")
	scrollFrame.Name = "ScrollFrame" .. suffix
	scrollFrame.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right
	scrollFrame.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
	scrollFrame.ElasticBehavior = Enum.ElasticBehavior.Never
	scrollFrame.ScrollBarThickness = 17
	scrollFrame.BorderSizePixel = 0
	scrollFrame.BackgroundTransparency = 1
	scrollFrame.ZIndex = 2
	scrollFrame.TopImage = "http://www.roblox.com/asset/?id=1533255544"
	scrollFrame.MidImage = "http://www.roblox.com/asset/?id=1535685612"
	scrollFrame.BottomImage = "http://www.roblox.com/asset/?id=1533256504"
	scrollFrame.Size = UDim2.new(1, 0, 1, 0)
	scrollFrame.Position = UDim2.new(0, 0, 0, 0)
	scrollFrame.Parent = section
	
	local uiListLayout = Instance.new("UIListLayout")
	uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	uiListLayout.Parent = scrollFrame
	
	self._section = section
	self._scrollFrame = scrollFrame
	self._scrollBackground = scrollBackground
	self._uiListLayout = uiListLayout
	
	scrollFrame:GetPropertyChangedSignal("AbsoluteSize"):connect(function() self:_updateScrollingFrameCanvas() end)
	uiListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):connect(function() self:_updateScrollingFrameCanvas() end)
	self:_updateScrollingFrameCanvas()
	
	GuiUtilities.syncGuiElementScrollColor(scrollFrame)
	GuiUtilities.syncGuiElementBorderColor(scrollBackground)
	GuiUtilities.syncGuiElementTitleColor(scrollBackground)
	
	return self
end

function VerticalScrollingFrame:_updateScrollbarBackingVisibility()
	self._scrollBackground.Visible = self._scrollFrame.AbsoluteSize.y < self._uiListLayout.AbsoluteContentSize.y
end

function VerticalScrollingFrame:_updateScrollingFrameCanvas()
	self._scrollFrame.CanvasSize = UDim2.new(0, 0, 0, self._uiListLayout.AbsoluteContentSize.Y)
	self:_updateScrollbarBackingVisibility()
end

function VerticalScrollingFrame:GetContentsFrame()
	return self._scrollFrame
end

function VerticalScrollingFrame:GetSectionFrame()
	return self._section
end

return VerticalScrollingFrame