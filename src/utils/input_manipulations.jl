const _ARRAY_NOT_1D = "Supplied input array has more than one non-trivial dimension"

"""
Removes any tuples within an N-dimensional array, resulting in an (N+T)-dimensional
array, where T is the number of dimensions which were tuples.

## Input

input: an N-dimensional array, possibly containing tuples
to_array
## Returns

An (N+T)-dimensional array where any tuples have been converted to arrays.
"""
function remove_tuples(input)
    # The type of this dimension is an array, so skip
    if     typeof(input) <: Array  return to_array.(input)
    # The type of this dimension is a tuple, so convert it to an array
    elseif typeof(input) <: Tuple  return [to_array(e) for e in input]
    # The type of this dimension is not a container, so terminate
    else                           return input
    end
end