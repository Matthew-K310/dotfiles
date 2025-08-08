// Modify this file to change what commands output to your statusbar, and
// recompile using the make command.
static const Block blocks[] = {
    /*Icon*/ /*Command*/ /*Update Interval*/ /*Update Signal*/
    /* {"⌨", "sb-kbselect", 0, 30}, */
    {"", "cat /tmp/recordingicon 2>/dev/null", 0, 9},
    // {"", "sb-nowplaying", 1, 3},
    {"", "sb-music", 0, 11},
    {"", "sb-volume", 0, 10},
    {"", "sb-news", 0, 6},
    {"", "sb-mailbox", 180, 12},
    // {"", "sb-torrent", 20, 7},
    {"", "sb-doppler", 0, 13},
    {"", "sb-forecast", 18000, 5},
    {"", "sb-brightness", 1, 2},
    {"", "sb-nettraf", 1, 16},
    {"", "sb-internet", 5, 4},
    {"", "sb-clock", 60, 1},
    {"", "sb-help-icon", 0, 15},
};

// Sets delimiter between status commands. NULL character ('\0') means no
// delimiter.
static char *delim = " ";

// Have dwmblocks automatically recompile and run when you edit this file in
// vim with the following line in your vimrc/init.vim:

// autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd
// ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid
// dwmblocks & }
