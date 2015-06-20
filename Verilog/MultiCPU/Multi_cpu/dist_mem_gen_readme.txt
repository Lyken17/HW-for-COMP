
                    Core name: Xilinx Distributed Memory Generator 
                    Version: v3.4
                    Release Date: March 24, 2008


================================================================================

This document contains the following sections: 

1. Introduction
2. New Features
3. Resolved Issues
4. Known Issues 
5. Technical Support
6. Core Release History

========================================================================

1. INTRODUCTION

For the most recent updates to the IP installation instructions for this core,
please go to:

   www.xilinx.com/ipcenter/coregen/ip_update_install_instructions.htm

 
For system requirements:

   www.xilinx.com/ipcenter/coregen/ip_update_system_requirements.htm 


This file contains release notes for the Xilinx LogiCORE IP FIFO Generator v4.3
solution. For the latest core updates, see the product page at:
 
   www.xilinx.com/products/ipcenter/DIST_MEM_GEN.htm


2. NEW FEATURES  
 
   - ISE 10.1 software support

 
3. RESOLVED ISSUES 
 
   - DPRA Reg is clocked by CLK unless output registers are used. DPRA 
     Reg should be clocked by QDPO_CLK regardless of whether output
     registers are implemented
     - CR  440076
     - AR  25360 

   - Dist Mem Gen v3.3 -Figure 6 CE registers show incorrect input clock.
     - CR  440140
     - AR  25361


  4. KNOWN ISSUES 

     The following are known issues for v3.4 of this core at time of release:
   
   - When a large Distributed Memory Generator IP is generated, CORE
     Generator runs out of memory and fails to generate.
     - CR  431917

   
   The most recent information, including known issues, workarounds, and
   resolutions for this version is provided in the release notes Answer Record
   for the ISE 10.1i IP Update 1 at 

   www.xilinx.com/xlnx/xil_ans_display.jsp?getPagePath=29767


5. TECHNICAL SUPPORT 

   To obtain technical support, create a WebCase at www.xilinx.com/support.
   Questions are routed to a team with expertise using this product.  
     
   Xilinx provides technical support for use of this product when used
   according to the guidelines described in the core documentation, and
   cannot guarantee timing, functionality, or support of this product for
   designs that do not follow specified guidelines.

6. CORE RELEASE HISTORY 

Date           By            Version      Description
========================================================================
03/24/2008    Xilinx, Inc.   3.4          10.1 support; Revised to v3.4.
========================================================================


(c) 2005-2008 Xilinx, Inc. All Rights Reserved. 


XILINX, the Xilinx logo, and other designated brands included herein are
trademarks of Xilinx, Inc. All other trademarks are the property of their
respective owners.

Xilinx is disclosing this user guide, manual, release note, and/or
specification (the Documentation) to you solely for use in the development
of designs to operate with Xilinx hardware devices. You may not reproduce, 
distribute, republish, download, display, post, or transmit the Documentation
in any form or by any means including, but not limited to, electronic,
mechanical, photocopying, recording, or otherwise, without the prior written 
consent of Xilinx. Xilinx expressly disclaims any liability arising out of
your use of the Documentation.  Xilinx reserves the right, at its sole 
discretion, to change the Documentation without notice at any time. Xilinx
assumes no obligation to correct any errors contained in the Documentation, or
to advise you of any corrections or updates. Xilinx expressly disclaims any
liability in connection with technical support or assistance that may be
provided to you in connection with the information. THE DOCUMENTATION IS
DISCLOSED TO YOU AS-IS WITH NO WARRANTY OF ANY KIND. XILINX MAKES NO 
OTHER WARRANTIES, WHETHER EXPRESS, IMPLIED, OR STATUTORY, REGARDING THE
DOCUMENTATION, INCLUDING ANY WARRANTIES OF MERCHANTABILITY, FITNESS FOR A 
PARTICULAR PURPOSE, OR NONINFRINGEMENT OF THIRD-PARTY RIGHTS. IN NO EVENT 
WILL XILINX BE LIABLE FOR ANY CONSEQUENTIAL, INDIRECT, EXEMPLARY, SPECIAL, OR
INCIDENTAL DAMAGES, INCLUDING ANY LOSS OFDATA OR LOST PROFITS, ARISING FROM
YOUR USE OF THE DOCUMENTATION.

