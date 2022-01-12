local Math = {}

function Math:wrap(i, a, b)
    if i > b then
        return a
    elseif i < a then
        return b
    else
        return i
    end
end

return Math