getgenv().getscripts = newcclosure(function()
    local Result = {}
    for Scripts in pairs(getscriptenvs()) do
        Result[#Result + 1] = Scripts
    end
    return Result
end)

getgenv().get_scripts = getscripts

getgenv().getinstances = newcclosure(function()
    local Result = {}
    for _,V in pairs(game:GetDescendants()) do
        Result[#Result + 1] = V
    end
    for _,V in pairs(get_nil_instances()) do
        Result[#Result + 1] = V
    end
    return Result
end)

getgenv().get_instances = getinstances

getgenv().isfile = newcclosure(function(File)
    local Suc, Er = pcall(readfile, File)
    return Suc
end)

getgenv().isfolder = newcclosure(function(Folder)
    return #list_directory(Folder) > 0
end)

getgenv().syn.set_thread_identity = newcclosure(function(Int)
    set_thread_context(Int)
end)

getgenv().syn.get_thread_identity = newcclosure(function()
    return get_thread_context()
end)

getgenv().syn.queue_on_teleport = newcclosure(function(Code)
    queue_on_teleport(Code)
end)
