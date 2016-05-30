--loop through the model
--find sub-models
--find anchored parts within the models

parentFolder = script.Parent.Parent
children = parentFolder:GetChildren()
button = parentFolder.unanchorButton.SurfaceGui.TextButton
baseplate = game.Workspace.Baseplate

function unanchor()
  for i, part in ipairs(children) do
    if part:IsA("Model") then
      subChildren = part:GetChildren()
      print"found model"

      for i, part in ipairs(subChildren) do
        if part:IsA("Part") and part ~= button then
          part.Anchored = false
        elseif part:IsA("UnionOperation") then
          part.Anchored = false
        elseif part:IsA("WedgePart") then
          part.Anchored = false
        else
          --whatever this is it isn't a part
        end
      end

    elseif part:IsA("Part") and part.Locked == false then
      part.Anchored = false
    elseif part:IsA("Part") and part.Locked == true then
      --don't unanchor this
    elseif part:IsA("UnionOperation") then
      part.Anchored = false
    elseif part:IsA("WedgePart") then
      part.Anchored = false
    else
      --whatever this is it isn't a part
    end
  end
end

button.MouseButton1Click:connect(unanchor)
