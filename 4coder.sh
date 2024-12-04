#!/bin/bash

git clone --depth=1 https://github.com/4coder-community/4cc 
cd 4cc/code
sed -i '/#include "linux_4ed_audio.cpp"/ s/^/\/\//' platform_linux/linux_4ed.cpp
sed -i '/linuxvars.audio_thread = system_thread_launch(&linux_audio_main, NULL);/ s/^/\/\//' platform_linux/linux_4ed.cpp
sed -i '/string_match(ext, string_u8_litexpr("hpp")) ||/a\string_match(ext, string_u8_litexpr("4coder")) ||' custom/4coder_default_hooks.cpp
bin/package-linux.sh
cd ..
cd current_dist_super_x64/4coder
cp ../../../AnonymiceProNerdFontMono-Regular.ttf fonts/
# sed -i 's/show_line_number_margins = false/show_line_number_margins = true/' config.4coder
sed -i 's/treat_as_code = ".cpp.c.hpp.h.cc.cs.java.rs.glsl.m.mm"/treat_as_code = ".cpp.c.hpp.h.cc.glsl.m.mm.4coder"/' config.4coder
sed -i 's/automatically_load_project = false/automatically_load_project = true/' config.4coder
sed -i 's/default_font_name = "liberation-mono.ttf";/default_font_name = "AnonymiceProNerdFontMono-Regular.ttf";/' config.4coder
sed -i 's/default_font_size = 16/default_font_size = 18/' config.4coder
# sed -i 's/default_theme_name = "4coder"/default_theme_name = "theme-byp"/' config.4coder
sed -i 's/user_name = "not-set"/user_name = "sampie"/' config.4coder
sed -i '/{ "project_fkey_command", "F16" },/ {n; s/^/    { "close_panel", "P", "Control", "Shift" },\n/;}' bindings.4coder
# git clone --depth=1 https://github.com/B-Y-P/4coder_byp.git
# cd 4coder_byp
# git submodule init
# git submodule update
# ./build.sh release
# cp theme-byp.4coder ../themes/
cd ..
cp -r 4coder ~/
