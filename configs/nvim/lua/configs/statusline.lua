return {
    render = function(props)
        local function get_diagnostic_label()
            local icons =
                { error = '', warn = '', info = '', hint = '' }
            local label = {}

            for severity, icon in pairs(icons) do
                local n = #vim.diagnostic.get(props.buf, {
                    severity = vim.diagnostic.severity[string.upper(severity)],
                })
                if n > 0 then
                    table.insert(label, {
                        icon .. n .. ' ',
                        group = 'DiagnosticSign' .. severity,
                    })
                end
            end
            return label
        end

        return {
            { get_diagnostic_label() },
        }
    end,
}
