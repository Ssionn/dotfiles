require('lualine').setup({
  options = {
    theme = {
      normal = {
        a = { fg = '#DCD7BA', bg = '#4b5563', gui = 'bold' },
        b = { fg = '#C8C093', bg = '#2A2A37' },
        c = { fg = '#C8C093', bg = '#2A2A37' }
      },
      insert = {
        a = { fg = '#DCD7BA', bg = '#166534', gui = 'bold' },
        b = { fg = '#C8C093', bg = '#2A2A37' }
      },
      visual = {
        a = { fg = '#DCD7BA', bg = '#9333ea', gui = 'bold' },
        b = { fg = '#C8C093', bg = '#2A2A37' }
      },
      replace = {
        a = { fg = '#DCD7BA', bg = '#43242B', gui = 'bold' },
        b = { fg = '#C8C093', bg = '#2A2A37' }
      },
      command = {
        a = { fg = '#DCD7BA', bg = '#363646', gui = 'bold' },
        b = { fg = '#C8C093', bg = '#2A2A37' }
      },
      inactive = {
        a = { fg = '#727169', bg = '#2A2A37' },
        b = { fg = '#727169', bg = '#2A2A37' },
        c = { fg = '#727169', bg = '#2A2A37' }
      }
    },
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      {
        'mode',
        fmt = function(str)
          return str
        end,
      }
    },
    lualine_b = {
      {
        'branch',
        icon = '󰘬',
        color = { fg = '#7E9CD8', bg = '#2A2A37' },
      },
      {
        'diff',
        symbols = { added = '+', modified = '~', removed = '-' },
        diff_color = {
          added = { fg = '#76946A' },
          modified = { fg = '#DCA561' },
          removed = { fg = '#C34043' },
        },
      },
    },
    lualine_c = {
      {
        'filename',
        path = 1,
        color = { fg = '#DCD7BA', bg = '#2A2A37' },
      }
    },
    lualine_x = {
      {
        'diagnostics',
        symbols = { error = '󰅚 ', warn = '󰀦 ', info = '󰋼 ', hint = '󰌵 ' },
        diagnostics_color = {
          error = { fg = '#E82424' },
          warn = { fg = '#FF9E3B' },
          info = { fg = '#658594' },
          hint = { fg = '#6A9589' },
        },
      },
    },
    lualine_y = {
      {
        'filetype',
        color = { fg = '#957FB8', bg = '#2A2A37' },
      }
    },
    lualine_z = {
      {
        'location',
        color = { fg = '#DCD7BA', bg = '#2A2A37' },
      }
    }
  },
})
