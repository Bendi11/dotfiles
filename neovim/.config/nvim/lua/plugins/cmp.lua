local M = {}

M.setup = function()
    local ok, luasnip = pcall(require, 'luasnip')
    if not ok then
        return
    end

    local ok, cmp = pcall(require, 'cmp')
    if not ok then
        return
    end

    local ok, lspkind = pcall(require, 'lspkind')
    if not ok then
        return
    end

    cmp.setup({
        formatting = {
            format = lspkind.cmp_format({
                with_text = true
            })
        },
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end
        },
        mapping = {
            ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
            ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
            ['<C-Space>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    local entry = cmp.get_selected_entry()
                    if not entry then
                        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                    end
                    cmp.confirm()
                else
                    cmp.complete({ reason = cmp.ContextReason.Manual })
                end
            end, {'i', 's', 'c'}),
            ['<Up>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    local entry = cmp.get_selected_entry()
                    if not entry then
                        fallback()
                    else
                        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
                    end
                else
                    fallback()
                end
            end, {'i', 'c'}),
            ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
            ['<CR>'] = cmp.mapping(function(fallback)
                if not cmp.visible() or not cmp.get_selected_entry() then
                    fallback()
                    return
                end
                cmp.confirm()
            end),
            ['<C-q>'] = cmp.mapping.close(),
        },
        sources = cmp.config.sources({
            {
                name = 'nvim_lsp',
            },
            { name = 'luasnip' },
        }, {
            { name = 'buffer' },
        }),
        experimental = {
            ghost_text = true,
        },
        sorting = {
            comparators = {
                cmp.config.compare.recently_used,
                cmp.config.compare.order,
                cmp.config.compare.score,
                cmp.config.compare.kind,
                cmp.config.compare.offset,
                cmp.config.compare.exact,
                cmp.config.compare.sort_text,
                cmp.config.compare.length,
            }
        }
    })

    cmp.setup.cmdline(':', {
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
            { name = 'cmdline' }
        })
    })
end

return M
