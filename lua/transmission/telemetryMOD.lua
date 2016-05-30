--module script!!

--run = game:GetService("RunService")




local _M = {}  -- name is only a convention, to mirror _G

function _M.getRPM(part)
  --returns the part's rotational velocity in RPM
  local velocity = part.RotVelocity
  local finalVel = (velocity.X + velocity.Y + velocity.Z) * 9.54929659643
  return finalVel
end

function _M.getTorque(part, radius)
  --returns the torque output of the specified part.
  --part must be cylinder
  --Needs to be accelerating/decelerating in order to produce torque
  local gravity = 9.81
  local density = part.CustomPhysicalProperties.Density * 999.9720
  local volume = math.pi * math.pow(radius, 2) * 0.09
  local mass = density * volume
  local inertia = 0.5 * mass * math.pow(radius, 2)

  return density, volume, mass, inertia
end

return _M
