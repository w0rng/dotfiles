return {
    {
        'jesseleite/nvim-noirbuddy',
        dependencies = {
            { 'tjdevries/colorbuddy.nvim', branch = 'dev' },
        },
        lazy = false,
        priority = 1000,
        opts = {
            styles = {
                italic = true,
                bold = true,
                underline = false,
                undercurl = false,
            },
        },
;        config = function(_, opts)
;            local exit_code = os.execute 'defaults read -g AppleInterfaceStyle'
;
;            if exit_code == 0 then
;                opts.preset = 'slate'
;            else
;                opts.colors = {
;                    background = '#FDF6E3',
;                    primary = '#000000',
;                    secondary = '#525252',
;                    noir_0 = '#525252',
;                    noir_1 = '#525252',
;                    noir_2 = '#525252',
 ;                   noir_3 = '#525252',
 ;                   noir_4 = '#525252',
 ;                   noir_5 = '#525252',
 ;                   noir_6 = '#E8F2E9',
 ;                   noir_7 = '#f2c445',
 ;                   noir_8 = '#C8DCCB',
 ;                   noir_9 = '#E8F2E9',
 ;                   diagnostic_error = '#EC0034',
 ;                   diagnostic_warning = '#EEB913',
 ;                   diagnostic_info = '#89B38E',
 ;                   diagnostic_hint = '#89B38E',
 ;                   diff_add = '#008E0E',
 ;                   diff_change = '#89B38E',
 ;                   diff_delete = '#EC0034',
 ;               }
  ;          end
;            require('noirbuddy').setup(opts)
;
 ;           local colorbuddy = require 'colorbuddy'
;
 ;           local colors = colorbuddy.colors
  ;          local Group = colorbuddy.Group
   ;         local groups = colorbuddy.groups
    ;        local styles = colorbuddy.styles
;
 ;           Group.new('Comment', colors.diff_add)
  ;          Group.new('Function', colors.noir_0, nil, styles.bold)
   ;         Group.new(
    ;            '@method.call',
     ;           groups.Function,
      ;          groups.Function,
       ;         groups.Function
       ;     )
       ;     Group.new(
       ;         '@lsp.type.method',
       ;         groups.Function,
       ;         groups.Function,
       ;         groups.Function
    ;        )
        end,
    },
}
