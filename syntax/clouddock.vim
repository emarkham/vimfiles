"
"$Id: clouddock.vim,v totally hacked on by Eric Markham, who doesn't know what
" the fuck he is doing
" Vim syntax file
" Language: clouddock log file
" Remark: Add some color to log files produced by SkySecure logging
"
"
" some other thoughts/TODOs:
"  indenting / line breaking for long-ass XML lines
"  re-ordering so timestamp is always first, message is always last
"  line breaks in Message: for '/' separated elements
"

" sample:
"{"Timestamp": "2016-04-13T19:44:57.598231212Z","Clouddock_SN": "CD02-H594LCXWBU","Program": "brahma_CentOS-NAT-2--3676","Message": "Posting App status - ASRunning/true/23/0","Level": "debug"}
" {"Subsystem": "Unknown","Program": "dnsproxy_localhost","Level":  "info","Timestamp": "2016-04-13T19:45:00.740596044Z","Clouddock_SN": "CD02-H594LCXWBU","Pid": 687,"Message": "Proxy reverse-lookup failed for 106.202.3.183. in-addr.arpa./50007 because 183.3.202.106 not resolved"}


if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif


"if exists("b:LargeFile_mode")
"  set colorcolumn=
"  set nowrap
"  finish
"endif

syn region   cloudText        start=/\v^[{]/ end=/\v[}]$/  oneline contains=cloudIP,cloudPID,cloudDate,cloudLevel0,cloudLevel1,cloudLevel2,cloudLevel3,cloudSerial,cloudProgram,cloudPort,error,attested
syn region   cloudDate        start=/"20[1-9][0-9]-[0-9][0-9]/ end=/"/  contained 
syn region   cloudSerial      start=/"Clouddock_SN": "/ end=/"/         contained
syn region   cloudPID         start=/"Pid":/ end=/,/                    contained
syn region   cloudProgram     start=/"Program": "/ end=/"/              contained 
syn match    cloudIP          /\(\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)\.\)\{3\}\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)/ nextgroup=cloudText skipwhite
syn match    cloudPort        /:[1-9][0-9]*[0-9]*[0-9]*[0-9]\(: \| \|"\)/           nextgroup=cloudText contained
syn match    cloudLevel0      /"Level": "debug"/                        nextgroup=cloudText contained
syn match    cloudLevel1      /"Level": "info"/                         nextgroup=cloudText contained 
syn match    cloudLevel2      /"Level": "warning"/                      nextgroup=cloudText contained
syn match    cloudLevel3      /"Level": "error"/                        nextgroup=cloudText contained
syn match    error            "\(CD\|CloudDock\) not attested"                         nextgroup=cloudText contained 
syn match    attested         "CloudDock attested with SC"              nextgroup=cloudText contained        


if !exists("did_cloud_syntax_inits")
   let did_cloud_syntax_inits = 1
   hi link cloudIP           Comment
   hi link cloudPort         Comment
   hi      cloudDate         ctermfg=lightblue    guifg=#AAAAFF
   hi      cloudProgram      ctermfg=lightyellow  guifg=#FFFFAA
   hi      cloudSerial       ctermfg=lightgreen   guifg=#AAFFAA
   hi link cloudText         Text
   hi      cloudLevel0       ctermfg=grey         guifg=#CCCCCC
   hi      cloudLevel1       ctermfg=lightblue    guifg=#AAFFFF
   hi      cloudLevel2       ctermfg=magenta      guifg=#FFAAFF
   hi      cloudlevel3       ctermfg=red          guifg=#FFAAAA
   hi      cloudPID          ctermfg=lightyellow  guifg=#FFFFAA
   hi      error             ctermfg=red       ctermbg=NONE  guifg=#FF3a3a guibg=NONE
   hi      attested          ctermfg=lightblue ctermbg=NONE  guifg=#9aFF9a guibg=NONE
   
endif

set colorcolumn=
set nowrap
let b:current_syntax="clouddock"
