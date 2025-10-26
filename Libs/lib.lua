local function PrintTable(table)
    print(textutils.serialise(table))
end

return {
    PrintTable = PrintTable
}