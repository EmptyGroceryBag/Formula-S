input = game:GetService("ContextActionService")
--run = game:GetService("RunService")



seat = script.Parent.Parent.seat -- placeholder seat until there actually is one
shaft = script.Parent.Parent.output_shaft

currentGear = script.Parent.currentGear.Value-- why doesn't this work??
neutralPos = 1.1
positionMod = 0.17

function upShift(action, input, object)
  if seat.Occupant then
    if input == Enum.UserInputState.Begin then
      if currentGear == 0 then
        shaft.set34.TargetPosition = neutralPos
        shaft.set12.TargetPosition = neutralPos + positionMod
        currentGear = currentGear + 1
      elseif currentGear == 1 then
        shaft.set34.TargetPosition = neutralPos
        shaft.set12.TargetPosition = neutralPos - positionMod
        currentGear = currentGear + 1
      elseif currentGear == 2 then
        shaft.set34.TargetPosition = neutralPos - positionMod
        shaft.set12.TargetPosition = neutralPos
        currentGear = currentGear + 1
      elseif currentGear == 3 then
        shaft.set34.TargetPosition = neutralPos + positionMod
        shaft.set12.TargetPosition = neutralPos
        currentGear = currentGear + 1
      elseif currentGear == 4 then
        print"can't upshift"
      end
    print(currentGear)
    end
  elseif not seat.Occupant then
    --nothing
  end
end

function downShift(action, input, object)
  if seat.Occupant then
    if input == Enum.UserInputState.Begin then
      if currentGear == 0 then
        print"can't downshift"
      elseif currentGear == 1 then
        shaft.set34.TargetPosition = neutralPos
        shaft.set12.TargetPosition = neutralPos
        currentGear = currentGear - 1
      elseif currentGear == 2 then
        shaft.set34.TargetPosition = neutralPos
        shaft.set12.TargetPosition = neutralPos + positionMod
        currentGear = currentGear - 1
      elseif currentGear == 3 then
        shaft.set34.TargetPosition = neutralPos
        shaft.set12.TargetPosition = neutralPos - positionMod
        currentGear = currentGear - 1
      elseif currentGear == 4 then
        --downshifting into 3
        shaft.set34.TargetPosition = neutralPos - positionMod
        shaft.set12.TargetPosition = neutralPos
        currentGear = currentGear - 1
      end
      print(currentGear)
    end
  elseif not seat.Occupant then
    --nothing
  end
end


input:BindAction("up shift", upShift, false, Enum.KeyCode.F)
input:BindAction("down shift", downShift, false, Enum.KeyCode.V)
