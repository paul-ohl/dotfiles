local status_ok, db = pcall(require, "dashboard")
if not status_ok then
	print("Cannot load dashboard")
	return
end

db.custom_header = {
	"=================     ===============     ===============   ========  ========",
	"\\\\ . . . . . . .\\\\   //. . . . . . .\\\\   //. . . . . . .\\\\  \\\\. . .\\\\// . . //",
	"||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\\/ . . .||",
	"|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||",
	"||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||",
	"|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\\ . . . . ||",
	"||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\\_ . .|. .||",
	"|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\\ `-_/| . ||",
	"||_-' ||  .|/    || ||    \\|.  || `-_|| ||_-' ||  .|/    || ||   | \\  / |-_.||",
	"||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \\  / |  `||",
	"||    `'         || ||         `'    || ||    `'         || ||   | \\  / |   ||",
	"||            .===' `===.         .==='.`===.         .===' /==. |  \\/  |   ||",
	"||         .=='   \\_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \\/  |   ||",
	"||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \\/  |   ||",
	"||   .=='    _-'          '-__\\._-'         '-_./__-'         `' |. /|  |   ||",
	"||.=='    _-'                                                     `' |  /==.||",
	"=='    _-'                        N E O V I M                         \\/   `==",
	"\\   _-'                                                                `-_   /",
	" `''                                                                      ``' "
}

db.custom_center = {
	{ icon = '   ', desc = 'Search files', action = 'Telescope find_files' },
	{ icon = '     ', desc = 'git status', action = 'Git' },
	{ icon = '  ', desc = 'Wiki dashboard', action = 'VimwikiIndex' },
	{ icon = '  ', desc = 'Today\'s diary', action = 'VimwikiMakeDiaryNote' },
	{ icon = '理   ', desc = 'Todos', action = 'VimwikiMakeDiaryNote' },
}
db.hide_tabline = false

-- db.custom_footer  -- type can be nil,table or function(must be return table in function)
-- db.preview_file_Path    -- string type
-- db.preview_file_height  -- string type
-- db.preview_file_width   -- string type
-- db.preview_command      -- string type
-- db.hide_statusline      -- boolean default is true.it will hide statusline in dashboard buffer and auto open in other buffer
-- db.session_directory    -- string type the directory to store the session file
--
-- -- example of db.custom_center for new lua coder,the value of nil mean if you
-- -- don't need this filed you can not write it
-- db.custom_center = {
--   { icon = 'some icon' desc = 'some description here' } --correct if you don't action filed
--   { desc = 'some description here' }                    --correct if you don't action and icon filed
--   { desc = 'some description here' action = 'Telescope find files'} --correct if you don't icon filed
-- }
--
-- -- Highlight Group
-- DashboardHeader DashboardCenter DashboardCenterIcon DashboardShortCut DashboardFooter
--
-- -- Command
--
-- DashboardNewFile  -- if you like use `enew` to create file,Please use this command,it's wrap enew and restore the statsuline and tabline
-- SessionSave,SessionLoad
