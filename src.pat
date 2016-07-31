
-- description generated by Pat driver

--			date     : Wed May 27 18:59:35 2015
--			revision : v109

--			sequence : src

-- input / output list :
in       word_in (7 downto 0) X;;;
out      error_out B;;;
out      address_out (7 downto 0) X;;;
out      data_out (7 downto 0) X;;;
in       reset B;;;
in       ck B;;;
in       vdd B;;;
in       vss B;;;

begin

-- Pattern description :

--                                    w    e   a    d   r  c  v  v   
--                                    o    r   d    a   e  k  d  s   
--                                    r    r   d    t   s     d  s   
--                                    d    o   r    a   e            
--                                    _    r   e    _   t            
--                                    i    _   s    o                
--                                    n    o   s    u                
--                                         u   _    t                
--                                         t   o                     
--                                             u                     
--                                             t                     


-- Beware : unprocessed patterns

<          0 ns>simulationofdiffe_0 : 00  ?*  ?**  ?**  1  0  1  0  ;
<         50 ns>                    : 00  ?*  ?**  ?**  1  1  1  0  ;
<        100 ns>                    : 00  ?*  ?**  ?**  0  0  1  0  ;
<        150 ns>                    : 7e  ?*  ?**  ?**  0  1  1  0  ;
<        200 ns>                    : 7e  ?*  ?**  ?**  0  0  1  0  ;
<        250 ns>                    : 80  ?*  ?**  ?**  0  1  1  0  ;
<        300 ns>                    : 80  ?*  ?**  ?**  0  0  1  0  ;
<        350 ns>                    : 74  ?*  ?**  ?**  0  1  1  0  ;
<        400 ns>                    : 74  ?*  ?**  ?**  0  0  1  0  ;
<        450 ns>                    : 22  ?*  ?**  ?**  0  1  1  0  ;
<        500 ns>                    : 22  ?*  ?**  ?**  0  0  1  0  ;
<        550 ns>                    : e7  ?*  ?**  ?**  0  1  1  0  ;
<        600 ns>                    : e7  ?*  ?**  ?**  0  0  1  0  ;
<        650 ns>                    : 7e  ?*  ?**  ?**  0  1  1  0  ;
<        700 ns>                    : 7e  ?*  ?**  ?**  0  0  1  0  ;
<        750 ns>                    : 81  ?*  ?**  ?**  0  1  1  0  ;
<        800 ns>                    : 81  ?*  ?**  ?**  0  0  1  0  ;
<        850 ns>                    : 78  ?*  ?**  ?**  0  1  1  0  ;
<        900 ns>                    : 78  ?*  ?**  ?**  0  0  1  0  ;
<        950 ns>                    : 22  ?*  ?**  ?**  0  1  1  0  ;
<       1000 ns>                    : 22  ?*  ?**  ?**  0  0  1  0  ;
<       1050 ns>                    : aa  ?*  ?**  ?**  0  1  1  0  ;
<       1100 ns>                    : aa  ?*  ?**  ?**  0  0  1  0  ;
<       1150 ns>                    : e7  ?*  ?**  ?**  0  1  1  0  ;
<       1200 ns>                    : e7  ?*  ?**  ?**  0  0  1  0  ;
<       1250 ns>                    : 7e  ?*  ?**  ?**  0  1  1  0  ;
<       1300 ns>                    : 7e  ?*  ?**  ?**  0  0  1  0  ;
<       1350 ns>                    : 82  ?*  ?**  ?**  0  1  1  0  ;
<       1400 ns>                    : 82  ?*  ?**  ?**  0  0  1  0  ;
<       1450 ns>                    : 74  ?*  ?**  ?**  0  1  1  0  ;
<       1500 ns>                    : 74  ?*  ?**  ?**  0  0  1  0  ;
<       1550 ns>                    : 22  ?*  ?**  ?**  0  1  1  0  ;
<       1600 ns>                    : 22  ?*  ?**  ?**  0  0  1  0  ;
<       1650 ns>                    : e7  ?*  ?**  ?**  0  1  1  0  ;
<       1700 ns>                    : e7  ?*  ?**  ?**  0  0  1  0  ;
<       1750 ns>                    : 7e  ?*  ?**  ?**  0  1  1  0  ;
<       1800 ns>                    : 7e  ?*  ?**  ?**  0  0  1  0  ;
<       1850 ns>                    : 80  ?*  ?**  ?**  0  1  1  0  ;
<       1900 ns>                    : 80  ?*  ?**  ?**  0  0  1  0  ;
<       1950 ns>                    : 74  ?*  ?**  ?**  0  1  1  0  ;
<       2000 ns>                    : 74  ?*  ?**  ?**  0  0  1  0  ;
<       2050 ns>                    : 22  ?*  ?**  ?**  0  1  1  0  ;
<       2100 ns>                    : 22  ?*  ?**  ?**  0  0  1  0  ;
<       2150 ns>                    : e8  ?*  ?**  ?**  0  1  1  0  ;
<       2200 ns>                    : e8  ?*  ?**  ?**  0  0  1  0  ;
<       2250 ns>                    : e7  ?*  ?**  ?**  0  1  1  0  ;
<       2300 ns>                    : e7  ?*  ?**  ?**  0  0  1  0  ;
<       2350 ns>                    : 7e  ?*  ?**  ?**  0  1  1  0  ;
<       2400 ns>                    : 7e  ?*  ?**  ?**  0  0  1  0  ;
<       2450 ns>                    : 81  ?*  ?**  ?**  0  1  1  0  ;
<       2500 ns>                    : 81  ?*  ?**  ?**  0  0  1  0  ;
<       2550 ns>                    : 78  ?*  ?**  ?**  0  1  1  0  ;
<       2600 ns>                    : 78  ?*  ?**  ?**  0  0  1  0  ;
<       2650 ns>                    : 22  ?*  ?**  ?**  0  1  1  0  ;
<       2700 ns>                    : 22  ?*  ?**  ?**  0  0  1  0  ;
<       2750 ns>                    : aa  ?*  ?**  ?**  0  1  1  0  ;
<       2800 ns>                    : aa  ?*  ?**  ?**  0  0  1  0  ;
<       2850 ns>                    : ee  ?*  ?**  ?**  0  1  1  0  ;
<       2900 ns>                    : ee  ?*  ?**  ?**  0  0  1  0  ;
<       2950 ns>                    : e7  ?*  ?**  ?**  0  1  1  0  ;
<       3000 ns>                    : e7  ?*  ?**  ?**  0  0  1  0  ;
<       3050 ns>                    : 00  ?*  ?**  ?**  0  0  1  0  ;

end;
