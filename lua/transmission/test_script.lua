library = require(script.Parent.telemetry)

-- while true do
--   print(library.getOutput(script.Parent.Parent.output_shaft))
--   wait(0.5)
-- end

print(library.getTorque(script.Parent.Parent.input_shaft, 0.75))
