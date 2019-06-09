/* Template config.do */
/* Copy this file to your replication directory, e.g.,
   svn cp template-config.do replication-(netid)/config.do

   or similar, and then add

   include "config.do"

   in the author's main Stata program

   */

/* check if the author creates a log file. If not, adjust the following code fragment */

local c_date = c(current_date)
local cdate = subinstr("`c_date'", " ", "_", .)
log using "logfile_`cdate'.log", replace text

/* keep this line in the config file */
di "=== SYSTEM DIAGNOSTICS ==="
di "Stata version: `c(stata_version)'"
di "Updated as of: `c(born_date)'"
di "Flavor:        `c(flavor)'"
di "Processors:    `c(processors)'"
di "OS:            `c(os)' `c(osdtl)'"
di "Machine type:  `c(machine_type)'"
di "=========================="

/* install any packages locally */
local pwd : pwd
capture mkdir "`pwd'/ado"
sysdir set PERSONAL "`pwd'/ado/personal"
sysdir set PLUS     "`pwd'/ado/plus"
sysdir set SITE     "`pwd'/ado/site"

/* set basepath*/
global basepath "//rschfs1x/userRS/a-e/ap676_RS/Documents/Workspace/app.20150512/replication-ap676/APP2015-0512_data"
