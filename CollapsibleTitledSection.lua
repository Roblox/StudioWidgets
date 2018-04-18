----------------------------------------
--
-- CollapsibleTitledSectionClass
--
-- Creates a section with a title label:
--
-- "SectionXXX"
--     "TitleBarVisual"
--     "Contents"
--
-- Requires "parent" and "sectionName" parameters and returns the section and its contentsFrame
-- The entire frame will resize dynamically as contents frame changes size.
--
--  "showTitle" is true by default and will not display the section title if false
-- Both "minimizeable" and "minimizedByDefault" are false by default
-- These parameters define if the section will have an arrow button infront of the title label, 
-- which the user may use to hide the section's contents
--
----------------------------------------
GuiUtilities = require(script.Parent.GuiUtilities)

local kRightButtonAsset = "rbxasset://textures/TerrainTools/button_arrow.png"
local kDownButtonAsset = "rbxasset://textures/TerrainTools/button_arrow_down.png"

local kArrowSize = 9

CollapsibleTitledSectionClass = {}
CollapsibleTitledSectionClass.__index = CollapsibleTitledSectionClass


function CollapsibleTitledSectionClass.new(nameSuffix, titleText, showTitle, minimizable, minimizedByDefault)
	local self = {}
	setmetatable(self, CollapsibleTitledSectionClass)

    showTitle = showTitle or showTitle == nil
    
    self._minimized = minimizedByDefault
    self._minimizable = minimizable

    self._titleBarHeight = showTitle and GuiUtilities.kTitleBarHeight or 0

    local frame = Instance.new('Frame')
    frame.Name = 'CTSection' .. nameSuffix
    frame.BackgroundTransparency = 1
    self._frame = frame

    local uiListLayout = Instance.new('UIListLayout')
    uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    uiListLayout.Parent = frame
    self._uiListLayout = uiListLayout

    local contentsFrame = Instance.new('Frame')
    contentsFrame.Name = 'Contents'
    contentsFrame.BackgroundTransparency = 1
    contentsFrame.Size = UDim2.new(1, 0, 0, 1)
    contentsFrame.Position = UDim2.new(0, 0, 0, titleBarSize)
    contentsFrame.Parent = frame
    contentsFrame.LayoutOrder = 2
    self._contentsFrame = contentsFrame

    uiListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):connect(function()
        self:_UpdateSize()
    end)
    self:_UpdateSize()

    if showTitle then
        self:_CreateTitleBar(titleText)
    end

    return self
end


function CollapsibleTitledSectionClass:GetSectionFrame()
    return self._frame
end

function CollapsibleTitledSectionClass:GetContentsFrame()
    return self._contentsFrame
end

function CollapsibleTitledSectionClass:_UpdateSize()
    local totalSize = self._uiListLayout.AbsoluteContentSize.Y
    if self._minimized then
        totalSize = self._titleBarHeight
    end
    self._frame.Size = UDim2.new(1, 0, 0, totalSize)
end

function CollapsibleTitledSectionClass:_UpdateMinimizeButton()
    -- We can't rotate it because rotated images don't get clipped by parents.
    -- This is all in a scroll widget.
    -- :(
    if (self._minimized) then 
        self._minimizeButton.Image = kRightButtonAsset
    else
        self._minimizeButton.Image = kDownButtonAsset
    end
end

function CollapsibleTitledSectionClass:_CreateTitleBar(titleText)
    local titleTextOffset = self._titleBarHeight

    local titleBar = Instance.new('Frame')
    titleBar.Name = 'TitleBarVisual'
    titleBar.BorderSizePixel = 0
    titleBar.Position = UDim2.new(0, 0, 0, 0)
    titleBar.Size = UDim2.new(1, 0, 0, self._titleBarHeight)
    titleBar.BackgroundColor3 = Color3.new(.85, .85, .85)        --todo: input spec section title background color
    titleBar.Parent = self._frame
    titleBar.LayoutOrder = 1

    local titleLabel = Instance.new('TextLabel')
    titleLabel.Name = 'TitleLabel'
    titleLabel.BackgroundTransparency = 1
    titleLabel.Font = Enum.Font.SourceSansBold                --todo: input spec font
    titleLabel.TextSize = 15                                  --todo: input spec font size
    titleLabel.TextColor3 = GuiUtilities.kStandardTextColor
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Text = titleText
    titleLabel.Position = UDim2.new(0, titleTextOffset, 0, 0)
    titleLabel.Size = UDim2.new(1, -titleTextOffset, 1, GuiUtilities.kTextVerticalFudge)
    titleLabel.Parent = titleBar

    if self._minimizable then
        self._minimizeButton = Instance.new('ImageButton')
        self._minimizeButton.Name = 'MinimizeSectionButton'
        self._minimizeButton.Image = kRightButtonAsset              --todo: input arrow image from spec
        self._minimizeButton.Size = UDim2.new(0, kArrowSize, 0, kArrowSize)
        self._minimizeButton.AnchorPoint = Vector2.new(0.5, 0.5)
        self._minimizeButton.Position = UDim2.new(0, self._titleBarHeight*.5,
             0, self._titleBarHeight*.5)
        self._minimizeButton.BackgroundTransparency = 1

        self._minimizeButton.MouseButton1Down:connect(function()
            self._minimized = not self._minimized
            self._contentsFrame.Visible = not self._minimized
            self:_UpdateMinimizeButton()
            self:_UpdateSize()
        end)
        self:_UpdateMinimizeButton()
        self._minimizeButton.Parent = titleBar
    end
end

return CollapsibleTitledSectionClass