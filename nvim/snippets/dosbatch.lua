local ls = require('luasnip')
local s = ls.s
local i = ls.i
local t = ls.t

local d = ls.dynamic_node
local c = ls.choice_node
local f= ls.function_node
local sn = ls.snippet_node

local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

local snippets, autosnippets = {}, {}

local vcvars = s('vcvars', fmt([[
SET "LIB="

SET VC_PATH=C:\Program Files (x86)\Microsoft Visual Studio 12.0
IF NOT DEFINED LIB (IF EXIST "%VC_PATH%" (call "%VC_PATH%\VC\vcvarsall.bat" x64))

SET VC_PATH=C:\Program Files (x86)\Microsoft Visual Studio 11.0
IF NOT DEFINED LIB (IF EXIST "%VC_PATH%" (call "%VC_PATH%\VC\vcvarsall.bat" x64))

SET VC_PATH=C:\Program Files (x86)\Microsoft Visual Studio 10.0
IF NOT DEFINED LIB (IF EXIST "%VC_PATH%" (call "%VC_PATH%\VC\vcvarsall.bat" x64))

SET VC_PATH=C:\Program Files (x86)\Microsoft Visual Studio 13.0
IF NOT DEFINED LIB (IF EXIST "%VC_PATH%" (call "%VC_PATH%\VC\vcvarsall.bat" x64))

SET VC_PATH=C:\Program Files (x86)\Microsoft Visual Studio 14.0
IF NOT DEFINED LIB (IF EXIST "%VC_PATH%" (call "%VC_PATH%\VC\vcvarsall.bat" x64))

SET VC_PATH=C:\Program Files (x86)\Microsoft Visual Studio\2017\Community
IF NOT DEFINED LIB (IF EXIST "%VC_PATH%" (call "%VC_PATH%\VC\Auxiliary\Build\vcvarsall.bat" x64))

SET VC_PATH=C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional
IF NOT DEFINED LIB (IF EXIST "%VC_PATH%" (call "%VC_PATH%\VC\Auxiliary\Build\vcvarsall.bat" x64))

SET VC_PATH=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community
IF NOT DEFINED LIB (IF EXIST "%VC_PATH%" (call "%VC_PATH%\VC\Auxiliary\Build\vcvarsall.bat" x64))

SET VC_PATH=C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional
IF NOT DEFINED LIB (IF EXIST "%VC_PATH%" (call "%VC_PATH%\VC\Auxiliary\Build\vcvarsall.bat" x64))

SET VC_PATH=C:\Program Files\Microsoft Visual Studio\2022\Community
IF NOT DEFINED LIB (IF EXIST "%VC_PATH%" (call "%VC_PATH%\VC\Auxiliary\Build\vcvarsall.bat" x64))

SET VC_PATH=C:\Program Files\Microsoft Visual Studio\2022\Professional
IF NOT DEFINED LIB (IF EXIST "%VC_PATH%" (call "%VC_PATH%\VC\Auxiliary\Build\vcvarsall.bat" x64))

]], {}))
table.insert(autosnippets, vcvars)

return snippets, autosnippets
