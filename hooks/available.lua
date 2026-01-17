--- Returns all available versions of Redis
--- @param ctx table Context object
--- @return table Array of version objects with version and optional note fields
function PLUGIN:Available(ctx)
    local http = require("http")

    local resp, err = http.get({
        url = "https://download.redis.io/releases/"
    })

    if err ~= nil then
        error("Failed to fetch Redis releases: " .. err)
    end

    local results = {}
    local seen = {}

    -- Parse HTML to extract version numbers from redis-X.Y.Z.tar.gz links
    for version in resp.body:gmatch("redis%-(%d+%.%d+%.%d+)%.tar%.gz") do
        if not seen[version] then
            seen[version] = true
            table.insert(results, {
                version = version,
                note = ""
            })
        end
    end

    -- Sort versions (simple string sort works for semver with same digit counts)
    table.sort(results, function(a, b)
        return a.version < b.version
    end)

    return results
end
