\m4_TLV_version 1d: tl-x.org
\SV
	//Calculator using sequentials
	//URL for this code - http://myth2.makerchip.com/sandbox/031fmhDQX/048hBOP#
   // =========================================
   // Welcome!  Try the tutorials via the menu.
   // =========================================

   // Default Makerchip TL-Verilog Code Template

   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   $reset = *reset;

   $val1[31:0] = >>1$out[31:0];
   $val2[31:0] = $rand2[3:0];

   $sum[31:0] = $val1[31:0] + $val2[31:0];
   $diff[31:0] = $val1[31:0] - $val2[31:0];
   $prod[31:0] = $val1[31:0] * $val2[31:0];
   $quot[31:0] = $val1[31:0] / $val2[31:0];

   $out[31:0] = $reset ? 0 : ($op[1] ? ( $op[0] ? $quot[31:0] : $prod[31:0] ) : ( $op[0] ? $diff[31:0] : $sum[31:0]));

   $cnt[31:0] = $reset ? 0 : (>>1$cnt + 1);
   $fib[31:0] = $reset ? 1 : (>>1$fib[31:0] + >>2$fib[31:0]);

   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
   
  
  
  
  
   \m4_TLV_version 1d: tl-x.org
\SV

   // =========================================
   // Welcome!  Try the tutorials via the menu.
   // =========================================
   // Calculator with 1 stage pipeline
   // URL for this code -  http://myth2.makerchip.com/sandbox/031fmhDQX/02RhpXX# 
   // Default Makerchip TL-Verilog Code Template
   
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   |calc
      @1
         $reset = *reset;
         $val1[31:0] = >>1$out[31:0];
         $val2[31:0] = $rand2[3:0]; 
         $sum[31:0] = $val1[31:0] + $val2[31:0];
         $diff[31:0] = $val1[31:0] - $val2[31:0];
         $prod[31:0] = $val1[31:0] * $val2[31:0];
         $quot[31:0] = $val1[31:0] / $val2[31:0];
         $out[31:0] = $reset ? 0 : ($op[1] ? ( $op[0] ? $quot[31:0] : $prod[31:0] ) : ( $op[0] ? $diff[31:0] : $sum[31:0]));
         $cnt[31:0] = $reset ? 0 : (>>1$cnt + 1);
         $fib[31:0] = $reset ? 1 : (>>1$fib[31:0] + >>2$fib[31:0]);
   
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
   
   
   \m4_TLV_version 1d: tl-x.org
\SV

   // =========================================
   // Welcome!  Try the tutorials via the menu.
   // =========================================
   // Calculator with 2 stage pipeline
   // URL for this code -  http://myth2.makerchip.com/sandbox/031fmhDQX/076hAK5# 
   // Default Makerchip TL-Verilog Code Template
   
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   |calc
      @1
         $reset = *reset;
         $val1[31:0] = >>2$out[31:0];
         $val2[31:0] = $rand2[3:0];
         $op[1:0] = $rand3[1:0];
         $sum[31:0] = $val1[31:0] + $val2[31:0];
         $diff[31:0] = $val1[31:0] - $val2[31:0];
         $prod[31:0] = $val1[31:0] * $val2[31:0];
         $quot[31:0] = $val1[31:0] / $val2[31:0];
         $valid = $reset ? 0 : (>>1$valid + 1);
         $fib[31:0] = $reset ? 1 : (>>1$fib[31:0] + >>2$fib[31:0]);
      @2
         $out[31:0] = $reset_or_valid ? 0 : ($op[1] ? ( $op[0] ? $quot[31:0] : $prod[31:0] ) : ( $op[0] ? $diff[31:0] : $sum[31:0]));
         $reset_or_valid = $reset | ~$valid;
         
   
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
   
   
   
   \m4_TLV_version 1d: tl-x.org
\SV

   // =========================================
   // Welcome!  Try the tutorials via the menu.
   // =========================================
   // Calculator with 2-stage pipeline and validity
   // URL for this code -  http://myth2.makerchip.com/sandbox/031fmhDQX/0vgh79l# 
   // Default Makerchip TL-Verilog Code Template
   
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   |calc
      @1
         $reset = *reset;
         $valid = $reset ? 0 : (>>1$valid + 1);
         $reset_or_valid = $valid | $reset;
         
      ?$reset_or_valid
         @1
            $val1[31:0] = >>2$out[31:0];
            $val2[31:0] = $rand2[3:0];
            $op[1:0] = $rand3[1:0];
            $sum[31:0] = $val1[31:0] + $val2[31:0];
            $diff[31:0] = $val1[31:0] - $val2[31:0];
            $prod[31:0] = $val1[31:0] * $val2[31:0];
            $quot[31:0] = $val1[31:0] / $val2[31:0];
            
         @2
            $out[31:0] = $reset ? 0 : ($op[1] ? ( $op[0] ? $quot[31:0] : $prod[31:0]) : 
                                             ( $op[0] ? $diff[31:0] : $sum[31:0]));
            

   
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
   
   
   \m4_TLV_version 1d: tl-x.org
\SV

   // =========================================
   // Welcome!  Try the tutorials via the menu.
   // =========================================
   // Calculator with memory and recall features
   // URL for this code -  http://myth2.makerchip.com/sandbox/031fmhDQX/0O7hp8y# 
   // Default Makerchip TL-Verilog Code Template
   
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   |calc
      @1
         $reset = *reset;
         $valid = $reset ? 0 : (>>1$valid + 1);
         $reset_or_valid = $valid | $reset;
         
      ?$reset_or_valid
         @1
            $val1[31:0] = >>2$out[31:0];
            $val2[31:0] = $rand2[3:0];
            $op[2:0] = $rand3[2:0];
            $sum[31:0] = $val1[31:0] + $val2[31:0];
            $diff[31:0] = $val1[31:0] - $val2[31:0];
            $prod[31:0] = $val1[31:0] * $val2[31:0];
            $quot[31:0] = $val1[31:0] / $val2[31:0];
            
         @2
            $mem[31:0] = $reset ? 0 : (($op[2:0] == 3'b101) ? $val1 : >>2$mem[31:0]);
            
            $out[31:0] = $reset ? 0 : (($op[2:0] == 3'b000) ? $sum[31:0] :
                                      (($op[2:0] == 3'b001) ? $diff[31:0] :
                                      (($op[2:0] == 3'b010) ? $prod[31:0] :
                                      (($op[2:0] == 3'b011) ? $quot[31:0] :
                                      (($op[2:0] == 3'b100) ? >>2$mem[31:0] :
                                                              >>2$out[31:0] )))));
            

   
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
