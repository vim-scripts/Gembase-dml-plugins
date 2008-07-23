" Vim syntax file
" Language:	    Gembase dml file
" Maintainer:       Frank Sun <frank.sun.319@gmail.com>
" Latest Revision:  2008-07-17
" Version: 2.0

syn case ignore
"syn spell toplevel

syn keyword gForms FORM MENU_FORM PROCEDURE_FORM QUERY_FORM REPORT_FORM TABLE_FORM END_FORM
syn keyword gBlocks BEGIN_BLOCK END_BLOCK INPUT_BLOCK MENU_BLOCK OUTPUT_BLOCK PAUSE_BLOCK YESNO_BLOCK
syn keyword gStructure END_IF END_WHILE END_CASE CASE ELSE
syn keyword gOperator AND OR NOT AND_B OR_B NOT_B contained
syn keyword gFunction ABS ACOS ASCII ASIN ATAN ATAN2 BINARY_TO_POLY CEIL CHR COMPRESS COMPRESS_ALL COS COSH DATE DATE_SECONDS DAY_OF_WEEK DAYS ERROR_TEXT EXPAND FACILITY_CLASS FACILITY_DESCRIPTION FACILITY_DML FACILITY_MENU_FILE FACILITY_MENU_FORM FACILITY_NAME FACILITY_SYSTEM FACILITY_TAG FIELD_BASED_ON FIELD_DATATYPE FIELD_DEFAULT FIELD_DESCRIPTION FIELD_HEADING FIELD_I_LENGTH FIELD_I_MASK FIELD_INITIAL_VALUE FIELD_MISSING FIELD_NAME FIELD_NATIVE FIELD_O_LENGTH FIELD_O_MASK FIELD_PROMPT FIELD_SCALE FIELD_SHORT_PROMPT FIELD_SIZE FIELD_SOURCE FIELD_VALID_VALUES FIELD_VALIDATION FIELD_VIEW_BASE FIND_FILE FLOOR GET_SCV INDEX_STORAGE INDEX_TYPE INDEX_UNIQUE INT IS_NULL IS_NULL_ON_STREAM LEFT LEN LOG LOG10 LOWERCASE LTOTAL LTRIM MASK MESSAGE MID MOD PARAMETER POLY_TO_BINARY POS RANDOM RECORD_ADDRESS RIGHT ROUND SECONDS SIN SINH SQRT STREAM_DATA STRING TABLE_CHECK TABLE_DATA TABLE_DESCRIPTION TABLE_FLAGS TABLE_NAME TABLE_PID TABLE_SEARCH TABLE_SECURITY TABLE_TYPE TAN TANH TOTAL TRIM UPPERCASE
syn keyword gStatement ACCESS ADD ADD_FORM ALL BACKGROUND BEGIN_DISABLE_TRIGGER BEGIN_SIGNAL_TO_STATUS CALL CHECK_DOMAIN CLEAR_BUFFER CLASS CLI CLOSE CLOSE_TEXT COMPILE CONNECT CONTINUE CROSS_REFERENCE DATABASE DATATYPE DATE_FORMAT DEBUG DEFAULTS DELETE DIR DISCONNECT DISPLAY DCL DOCUMENTATION DOMAIN EDIT END_DISABLE_TRIGGER END_EXECUTE END_ROW END_SIGNAL_TO_STATUS ENTRY_MENU ERASE ERROR EXECUTE EXIT EXTERNAL FETCH FIELD FIELDS FILES FINISH FIND FOR FOREGROUND FROM GENERATE GOTO ICON_NAME IN INDEX INPUT INTERRUPT INVOKE KEY KEYBOARD LINES_AFTER LINES_BEFORE LOAD LOCK_TIMEOUT MAIL MENU MODIFY NOERROR NOEXIT_FORWARD NOSTATUS NOVERIFY OFF ON OPEN OPEN_TEXT OUT PERFORM PRECISION PRINT PROCEDURE QUERY READ_LINE RECEIVE RECEIVE_ARGUMENTS RECEIVE_DATA RECEIVE_TABLE RELEASE REPORT REPOSITION REWIND_TEXT SCREEN SEARCH SEND SEND_DATA SEND_MESSAGE SEND_TABLE SET SHADOWS SHOW SQR START_STREAM STATUS STREAM_NAME SUCCESS SWITCH SWITCH_BASE TABLES TIMEOUT TIME_TRIGGER TITLE_BAR TITLE_FORM TO TRANSFER TRIGGER UNLOAD UTILITIES VERIFY VIEW VIEW_SOURCE WRITE WRITE_LINE COMMIT ROLLBACK START_TRANSACTION

syn region gTitle start=/^\s*TITLE/ end=/$/
syn region gComment start="^\s*!" end="$" 
syn region gQuote start="\"" end="\""
syn region gQuote start="\'" end="\'" 
syn region gBody matchgroup=gParentheses start=/(/ matchgroup=gParentheses end=/)/ contains=gBody,gQuote,gNumber,gOperator,gVariable,gSysVar,gComment
syn region gBody matchgroup=gStructure start=/\<IF\>\s*(/ matchgroup=gStructure end=/)/ contains=gBody,gQuote,gNumber,gOperator,gVariable,gSysvar,gComment
syn region gBody matchgroup=gStructure start=/\<ELSE_IF\>\s*(/ matchgroup=gStructure end=/)/ contains=gBody,gQuote,gNumber,gOperator,gVariable,gSysvar,gComment
syn region gBody matchgroup=gStructure start=/\<WHILE\>\s*(/ matchgroup=gStructure end=/)/ contains=gBody,gQuote,gNumber,gOperator,gVariable,gSysVar,gComment
syn region gBody matchgroup=gStructure start=/\<BEGIN_CASE\>\s*(/ matchgroup=gStructure end=/)/ contains=gBody,gQuote,gNumber,gOperator,gVariable,gSysVar,gComment

syn match gNumber /\<[0-9]*\.*[0-9]*\>/

syn match gOperator /&\s*$/
syn match gOperator /=/
syn match gOperator /</
syn match gOperator />/

syn match gVariable /#[a-zA-Z_][a-zA-Z_0-9]*/

syn match gQualifier /\/ABSOLUTE_POSITION/
syn match gQualifier /\/ADD_FORM/
syn match gQualifier /\/ALTERNATE_FORM/
syn match gQualifier /\/ATTRIBUTES/
syn match gQualifier /\/AUDIT/
syn match gQualifier /\/BACK/
syn match gQualifier /\/BASE/
syn match gQualifier /\/BEGIN_ROW/
syn match gQualifier /\/BREAK/
syn match gQualifier /\/BREAK0/
syn match gQualifier /\/COL/
syn match gQualifier /\/COLUMN_HEADING_ROW/
syn match gQualifier /\/COLUMN_HEADINGS/
syn match gQualifier /\/COLUMN_SPACING/
syn match gQualifier /\/COMMIT_RATE/
syn match gQualifier /\/DATETIME/
syn match gQualifier /\/DEFAULT_TAG/
syn match gQualifier /\/DELETE_FORM/
syn match gQualifier /\/DISPLAY_LENGTH/
syn match gQualifier /\/DISPLAY_ONLYX/
syn match gQualifier /\/DOMAIN/
syn match gQualifier /\/DOUBLE/
syn match gQualifier /\/END_ROW/
syn match gQualifier /\/ERASE/
syn match gQualifier /\/EXIT/
syn match gQualifier /\/EXIT_FORWARD/
syn match gQualifier /\/FACILITY/
syn match gQualifier /\/FAILURE/
syn match gQualifier /\/FIND_FORM/
syn match gQualifier /\/FIRST/
syn match gQualifier /\/FOOTING/
syn match gQualifier /\/FOOTING_FORM/
syn match gQualifier /\/GROUPED_BY/
syn match gQualifier /\/HEADING/
syn match gQualifier /\/HEADING_FORM/
syn match gQualifier /\/HEIGHT/
syn match gQualifier /\/INPUT_MASK/
syn match gQualifier /\/INPUT_ROW_HEIGHT/
syn match gQualifier /\/ITEM/
syn match gQualifier /\/ITEM_IF/
syn match gQualifier /\/JOINED_TO/
syn match gQualifier /\/LEN/
syn match gQualifier /\/LFOOTING/
syn match gQualifier /\/LHEADING/
syn match gQualifier /\/LINES_AFTER/
syn match gQualifier /\/LINES_BEFORE/
syn match gQualifier /\/LOCK/
syn match gQualifier /\/LOV/
syn match gQualifier /\/LOV_AUTO_SELECT/
syn match gQualifier /\/LOV_COL/
syn match gQualifier /\/LOV_DATA/
syn match gQualifier /\/LOV_FIRST/
syn match gQualifier /\/LOV_HEIGHT/
syn match gQualifier /\/LOV_NOHEADING/
syn match gQualifier /\/LOV_NOSEARCH/
syn match gQualifier /\/LOV_REDUCED_TO/
syn match gQualifier /\/LOV_ROW/
syn match gQualifier /\/LOV_SECONDARY/
syn match gQualifier /\/LOV_SELECTION/
syn match gQualifier /\/LOV_SORTED_BY/
syn match gQualifier /\/LOV_WIDTH/
syn match gQualifier /\/LOV_WITH/
syn match gQualifier /\/MODIFY_FORM/
syn match gQualifier /\/NEW/
syn match gQualifier /\/NOAUDIT/
syn match gQualifier /\/NOCLEAR_BUFFER/
syn match gQualifier /\/NODOMAIN/
syn match gQualifier /\/NOERROR/
syn match gQualifier /\/NOEXIT_FORWARD/
syn match gQualifier /\/NOHEADING/
syn match gQualifier /\/NOLOV_DATA/
syn match gQualifier /\/NOREPEAT/
syn match gQualifier /\/NOSTATUS/
syn match gQualifier /\/NOUNDERLINES/
syn match gQualifier /\/OPT/
syn match gQualifier /\/OPTIONS/
syn match gQualifier /\/OUTPUT/
syn match gQualifier /\/OUTPUT_MASK/
syn match gQualifier /\/PDF/
syn match gQualifier /\/PROMPT/
syn match gQualifier /\/PROTECT/
syn match gQualifier /\/PURPOSE/
syn match gQualifier /\/READ_ONLY/
syn match gQualifier /\/RECALL/
syn match gQualifier /\/REDUCED_TO/
syn match gQualifier /\/REMAIN/
syn match gQualifier /\/REPEAT/
syn match gQualifier /\/RFOOTING/
syn match gQualifier /\/RHEADING/
syn match gQualifier /\/ROW/
syn match gQualifier /\/ROW_HEIGHT/
syn match gQualifier /\/SAVE/
syn match gQualifier /\/SECONDARY/
syn match gQualifier /\/SELECTION/
syn match gQualifier /\/SEQUENCE/
syn match gQualifier /\/SEQUENCE_INCREMENT/
syn match gQualifier /\/SORTED_BY/
syn match gQualifier /\/SOURCE/
syn match gQualifier /\/SOURCE_IF/
syn match gQualifier /\/STATISTIC/
syn match gQualifier /\/STATUS/
syn match gQualifier /\/STREAM_NAME/
syn match gQualifier /\/SUCCESS/
syn match gQualifier /\/SYSTEM/
syn match gQualifier /\/TABLE/
syn match gQualifier /\/TAG/
syn match gQualifier /\/TAG_LENGTH/
syn match gQualifier /\/TARGET/
syn match gQualifier /\/TITLE/
syn match gQualifier /\/TOTAL/
syn match gQualifier /\/USE_IF/
syn match gQualifier /\/USER/
syn match gQualifier /\/USING/
syn match gQualifier /\/VALIDATION_FORM/
syn match gQualifier /\/WIDTH/
syn match gQualifier /\/WITH/

syn match gSysVar /%ACCOUNT/
syn match gSysVar /%ACTUAL_BREAK/
syn match gSysVar /%ADD/
syn match gSysVar /%ADMIN_ACCESS/
syn match gSysVar /%ADVANCE_USER/
syn match gSysVar /%ARCHIVE/
syn match gSysVar /%BACK/
syn match gSysVar /%BITMAP/
syn match gSysVar /%BROADCAST/
syn match gSysVar /%CAT_FILTER/
syn match gSysVar /%CHANGE_ACCESS/
syn match gSysVar /%CONTROL_ACCESS/
syn match gSysVar /%CURRENT_BREAK/
syn match gSysVar /%DATA/
syn match gSysVar /%DATABASE/
syn match gSysVar /%DEADLOCK/
syn match gSysVar /%DEFAULT_ENGINE/
syn match gSysVar /%DEFINE_ACCESS/
syn match gSysVar /%DELETE/
syn match gSysVar /%DELETE_ACCESS/
syn match gSysVar /%E/
syn match gSysVar /%EDIT_MODE/
syn match gSysVar /%EMPTY/
syn match gSysVar /%ENTRY_MENU/
syn match gSysVar /%ERASE_ACCESS/
syn match gSysVar /%EXIT/
syn match gSysVar /%EXIT_FORM_ACTIVE/
syn match gSysVar /%EXIT_FORM_ENABLED/
syn match gSysVar /%EXIT_FORM_FILENAME/
syn match gSysVar /%EXIT_FORM_FORMNAME/
syn match gSysVar /%EXIT_FORWARD/
syn match gSysVar /%FACILITY/
syn match gSysVar /%FACILITY_DATABASE/
syn match gSysVar /%FACILITY_NAME/
syn match gSysVar /%FACILITY_SYSTEM/
syn match gSysVar /%FAILURE/
syn match gSysVar /%FIND/
syn match gSysVar /%FORM_FILE/
syn match gSysVar /%FORM_NAME/
syn match gSysVar /%GEM_INIT/
syn match gSysVar /%GTID/
syn match gSysVar /%GTID_LEVEL/
syn match gSysVar /%HARDWARE/
syn match gSysVar /%HELP_LIBRARY/
syn match gSysVar /%HOSTID/
syn match gSysVar /%INPUT_BACKGROUND/
syn match gSysVar /%INPUT_DATE_FORMAT/
syn match gSysVar /%INPUT_FORGROUND/
syn match gSysVar /%INPUT_PROMPT/
syn match gSysVar /%INPUT_TIMEOUT/
syn match gSysVar /%INPUT_UPDATE/
syn match gSysVar /%INTERRUPT/
syn match gSysVar /%INTERRUPT_COMMAND/
syn match gSysVar /%IS_ADMIN/
syn match gSysVar /%KEYBOARD_FILE/
syn match gSysVar /%LANGUAGE/
syn match gSysVar /%LOCK_OPTIONS/
syn match gSysVar /%MASK_CURRENCY_SIGN/
syn match gSysVar /%MASK_RADIX_POINT/
syn match gSysVar /%MODE/
syn match gSysVar /%MODIFY/
syn match gSysVar /%MODIFY_ACCESS/
syn match gSysVar /%NODENAME/
syn match gSysVar /%NORMAL/
syn match gSysVar /%NOW/
syn match gSysVar /%OPERATIN_SYSTEM/
syn match gSysVar /%OPERATOR_ACCESS/
syn match gSysVar /%PAGE/
syn match gSysVar /%PERFORM/
syn match gSysVar /%PI/
syn match gSysVar /%PID/
syn match gSysVar /%PLATFORM/
syn match gSysVar /%PRECISION/
syn match gSysVar /%PRINT_MODE/
syn match gSysVar /%QUERY_CUR_REC/
syn match gSysVar /%QUERY_MAX_REC/
syn match gSysVar /%QUERY_MODE/
syn match gSysVar /%READ_ACCESS/
syn match gSysVar /%REPORT_DATE/
syn match gSysVar /%REPORT_FORM_FEEDS/
syn match gSysVar /%REPORT_MODE/
syn match gSysVar /%REPORT_NAME/
syn match gSysVar /%REPORT_PAGE_SIZE/
syn match gSysVar /%ROW_NUMBER/
syn match gSysVar /%SCREEN_MODE/
syn match gSysVar /%SCREEN_WIDTH/
syn match gSysVar /%SERVER/
syn match gSysVar /%SHADOW_LEVEL/
syn match gSysVar /%SHOW_ACCESS/
syn match gSysVar /%SIGNATURE_ID/
syn match gSysVar /%STATUS/
syn match gSysVar /%STATUS_FREQUENCY/
syn match gSysVar /%SUCCESS/
syn match gSysVar /%SYSTEM/
syn match gSysVar /%TARGETID/
syn match gSysVar /%TEMPORARY_DIRECTORY/
syn match gSysVar /%TERMINAL/
syn match gSysVar /%TEXTFILE_MODE/
syn match gSysVar /%THIN_CLIENT/
syn match gSysVar /%THIN_CLIENT_CHARSET/
syn match gSysVar /%THIN_CLIENT_HW/
syn match gSysVar /%THIN_CLIENT_IPCNAME/
syn match gSysVar /%THIN_CLIENT_MODE/
syn match gSysVar /%THIN_CLIENT_OS/
syn match gSysVar /%THIN_CLIENT_TYPE/
syn match gSysVar /%THIN_CLIENT_USERNAME/
syn match gSysVar /%THINS_CLIENT_REPORT_DIR/
syn match gSysVar /%THIN_SERVER/
syn match gSysVar /%THIN_SERVER_CHARSET/
syn match gSysVar /%THIN_SERVER_HW/
syn match gSysVar /%THIN_SERVER_IPCNAME/
syn match gSysVar /%THIN_SERVER_MODE/
syn match gSysVar /%THIN_SERVER_OS/
syn match gSysVar /%THIN_SERVER_REPORT_DIR/
syn match gSysVar /%THIN_SERVER_USERNAME/
syn match gSysVar /%TITLE_FORM/
syn match gSysVar /%TODAY/
syn match gSysVar /%TRANS_LEVEL/
syn match gSysVar /%UIC/
syn match gSysVar /%UIC_GRP/
syn match gSysVar /%UIC_MEM/
syn match gSysVar /%UNIX/
syn match gSysVar /%USERNAME/
syn match gSysVar /%VERSION/
syn match gSysVar /%WD/
syn match gSysVar /%WRITE_ACCESS/
syn match gSysVar /%XPID/

hi link gBlocks Structure
hi link gComment Comment
hi link gForms Function
"hi link gFunction Identifier
hi link gNumber Constant
hi link gOperator Operator
"hi link gQualifier Special
hi link gQuote String
hi link gStructure Conditional
hi link gStatement Statement
hi link gSysVar Constant
hi link gTitle PreProc
hi link gVariable Preproc
" Vim syntax file
