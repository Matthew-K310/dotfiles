return {
  {
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    ft = { 'org' },
    config = function()
      require('orgmode').setup {
        org_agenda_files = '~/Notes/org/**/*',
        org_default_notes_file = '~/Notes/org/inbox.org',
        mappings = {
          global = {
            org_agenda = '<leader>na',
            org_capture = '<leader>nc',
          },
        },
        org_capture_templates = {
          t = {
            description = 'Todo',
            template = '* TODO %^{Task}\n:PROPERTIES:\n:CREATED: %U\n:CAPTURED: %a\n:END:\n%?',
            target = '~/Notes/org/inbox.org',
          },
          e = {
            description = 'Event',
            template = '* %^{Event}\n%^{SCHEDULED}T\n:PROPERTIES:\n:CREATED: %U\n:CAPTURED: %a\n:END:\n%?',
            target = '~/Notes/org/calendar.org',
          },
          d = {
            description = 'Deadline',
            template = '* TODO %^{Task}\nDEADLINE: %^{Deadline}T\n:PROPERTIES:\n:CREATED: %U\n:CAPTURED: %a\n:END:\n%?',
            target = '~/Notes/org/calendar.org',
          },
          p = {
            description = 'Project',
            template = '* PROJ %^{Project name}\n:PROPERTIES:\n:CREATED: %U\n:CAPTURED: %a\n:END:\n** TODO %?',
            target = '~/Notes/org/projects.org',
          },
          i = {
            description = 'Idea',
            template = '** IDEA %^{Idea}\n:PROPERTIES:\n:CREATED: %U\n:CAPTURED: %a\n:END:\n%?',
            target = '~/Notes/org/ideas.org',
          },
          b = {
            description = 'Bookmark',
            template = '** [[%^{URL}][%^{Title}]]\n:PROPERTIES:\n:CREATED: %U\n:TAGS: %(org-capture-bookmark-tags)\n:END:\n\n',
            target = '~/Notes/org/bookmarks.html',
          },
          n = {
            description = 'Note',
            template = '* [%<%Y-%m-%d %a>] %^{Title}\n:PROPERTIES:\n:CREATED: %U\n:CAPTURED: %a\n:END:\n%?',
            target = '~/Notes/org/notes.org',
          },
        },
      }
    end,
  },
}
