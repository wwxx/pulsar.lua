
local fourDirections = {
  up    =  { 0,-1 },
  right =  { 1, 0 },
  down  =  { 0, 1 },
  left  =  {-1, 0 }
}

local eightDirections = {
  up         =  { 0,-1 },
  up_right   =  { 1,-1 },
  right      =  { 1, 0 },
  down_right =  { 1, 1 },
  down       =  { 0, 1 },
  down_left  =  {-1, 1 },
  left       =  {-1, 0 },
  up_left    =  {-1,-1 }
}

function buildNeighborFunction(grid, directions)

  return function(cell)

    local neighbors = {}

    for direction,delta in pairs(directions) do
      neighbors[direction] = grid(cell.x + delta[1], cell.y + delta[2])
    end

    return neighbors

  end
end

local neighborFunctions = {}

function neighborFunctions.fourDirections(grid)
  return buildNeighborFunction(grid, fourDirections)
end

function neighborFunctions.eightDirections(grid)
  return buildNeighborFunction(grid, eightDirections)
end

return neighborFunctions