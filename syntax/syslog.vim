"
"$Id: syslog.vim,v totally hacked on by Eric Markham, who doesn't know what
" the fuck he is doing
" Vim syntax file
" Language: syslog log file
" Remark: Add some color to log files produced by sysklogd.

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif


if exists("b:LargeFile_mode")
  finish
  set nowrap
endif


syn region   syslogText         start=/^[A-Z]/ end=/$/    oneline contains=syslogIP,syslogLevel,syslogLevel2,syslogEvent
syn match    syslogDate         /^.\{-}\d\d:\d\d:\d\d\s/  nextgroup=syslogHost skipwhite
syn match    syslogFacility     /sport\[0-9]\+\]/         contained
syn match    syslogFacility     /\(\S\+\)\{1}:/           contained 
syn match    syslogHost         /[a-zA-Z0-9]\+[^:]/       contained skipwhite nextgroup=syslogFacility
syn match    syslogIP          /\(\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)\.\)\{3\}\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\):[1-9][0-9]*[0-9]*[0-9]*[0-9]/ nextgroup=syslogText skipwhite
syn match    syslogCommit     "Finished database commit"  
syn match    syslogCommit     "Starting database commit"  
syn keyword  syslogLevel      WARN WARNING ERR ERROR CRIT CRITICAL ALERT Alarm ALARM nextgroup=syslogText skipwhite
syn keyword  syslogLevel2     NOTICE                    nextgroup=syslogText skipwhite
syn keyword  syslogEvent      EVENT                     nextgroup=syslogText skipwhite



"syn match    syslogText        /.*$/                    contains=ALL
"syn keyword  syslogLevel       WARN WARNING ERR ERROR CRIT CRITICAL ALERT Alarm ALARM nextgroup=syslogText skipwhite
"syn keyword  syslogLevel2      NOTICE                   nextgroup=syslogText skipwhite
"syn match    syslogIP          /\(\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)\.\)\{3\}\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\):[1-9][0-9]*[0-9]*[0-9]*[0-9]/ nextgroup=syslogText skipwhite
"syn match    syslogHost        /\S\+/                    nextgroup=syslogFacility,syslogText,syslogIP skipwhite
"syn match    syslogDate        /^.\{-}\d\d:\d\d:\d\d/    nextgroup=syslogHost skipwhite
"syn match    syslogFacility    /.\{-1,}:/                nextgroup=syslogText,syslogIP skipwhite

if !exists("did_syslog_syntax_inits")
  let did_syslog_syntax_inits = 1
   hi link syslogIP           Comment
   hi link syslogDate         Comment
   hi link syslogHost         Type
   hi link syslogFacility     Statement
   hi link syslogText         Text
   hi link syslogLevel        Constant
   hi link syslogLevel2       Comment
   hi link syslogCommit       NonText
   hi link syslogEvent        Underlined
endif

set nowrap
let b:current_syntax="syslog"
