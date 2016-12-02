require "table.new"

local floor = math.floor
local sqrt = math.sqrt
local time = os.time
local new  = table.new

local function get_primes7(n)
    if n < 2 then
        return {}
    elseif n == 2 then
        return {2}
    end

    local half = (n - 2) / 2
    local s = new(half, 0)
    local i = 1
    for j = 3, n, 2 do
        s[i] = j
        i = i + 1
    end

    local mroot = floor(sqrt(n))
    i = 1
    local m = 3
    while m <= mroot do
        if s[i] ~= 0 then
            local j = floor((m*m-3)/2) + 1
            while j <= half do
                s[j] = 0
                j = j + m
            end
        end
        m = 2*i + 3
        i = i + 1
    end

    local res = new(n / 100, 0)
    res[1] = 2
    i = 2
    for x = 1, half do
        if s[x] ~= 0 then
            res[i] = s[x]
            i = i + 1
        end
    end
    return res
end

local start_time = time()
local period_time = tonumber(os.getenv("RUN_TIME"))

while time() - start_time < period_time do
    local res = get_primes7(10000000)
    print("Found " .. #res .. " prime numbers.")
end
