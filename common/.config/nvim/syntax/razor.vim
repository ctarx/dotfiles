if exists("b:current_syntax")
  finish
endif

syn case ignore

syn match razorComment /#.*/
syn match razorComment /\/\/.*$/

syn region razorString start=/"/ skip=/\\\./ end=/"/ contains=razorInterpolation
syn region razorString start=/'/ skip=/\\\./ end=/'/ contains=razorInterpolation
syn match razorInterpolation /{{[A-Za-z_][A-Za-z0-9_]*}}/ contained

syn match razorNumber /\<\%(0x[0-9A-Fa-f]\+\|[0-9]\+\)\>/
syn match razorVariable /\<\%(backpack\|self\|lasttarget\|lastobject\|lefthand\|righthand\|hands\|ground\|index\)\>/

syn keyword razorBlock if elseif else endif while endwhile foreach endfor loop replay break continue stop
syn keyword razorKeyword as in and or not
syn keyword razorCommand attack cast classicuo cuo cleardragdrop clearhands cooldown dclick dclicktype dress drop droprelloc getlabel hotkey interrupt lift lifttype music potion random rename script setability setvar setvariable skill useskill sound unsetvar unsetvariable virtue walk wait pause wft waitfortarget undress
syn keyword razorCommand organizer restock scavenger sell useonce
syn keyword razorCommand gumpresponse gumpclose menu menuresponse promptresponse waitforgump waitformenu waitforprompt
syn keyword razorCommand clearall lasttarget setlasttarget target targetrelloc targetloc targettype waitfortarget
syn keyword razorCommand alliance clearsysmsg emote guild overhead say msg sysmsg waitforsysmsg wfsysmsg whisper yell
syn keyword razorCommand ignore unignore clearignore createlist clearlist removelist pushlist poplist
syn keyword razorCommand createtimer removetimer settimer

syn keyword razorExpression hp hits maxhp maxhits mana maxmana stam maxstam str dex int weight maxweight diffhits diffhp diffmana diffstam diffweight followers maxfollowers hidden paralyzed poisoned mounted warmode invuln invul blessed lhandempty rhandempty name position count counter findtype find insysmsg insysmessage itemcount queued targetexists findbuff varexist varexists timer timerexists listexists list inlist atlist poplist
syn keyword razorExpression findlayer noto dead bandaging gumpexists ingump cooldown pvp hue invul maxweight setskill

syn keyword razorValue true false on off primary secondary stun disarm closest random next prev self backpack ground harmful beneficial neutral any clear cancel nonfriendly friendly enemy red murderer gray grey criminal blue innocent friend humanoid monster

hi def link razorComment Comment
hi def link razorString String
hi def link razorInterpolation Special
hi def link razorNumber Number
hi def link razorVariable Identifier
hi def link razorBlock Conditional
hi def link razorKeyword Operator
hi def link razorCommand Function
hi def link razorExpression Constant
hi def link razorValue Type

let b:current_syntax = "razor"
