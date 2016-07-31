#include <genpat.h>
#include <stdio.h>

/* converts an integer to text characters required by genpat functions */
char *inttostr(entier)
     int entier;
{
  char *str;
  str = (char *) mbkalloc (32 * sizeof (char));
  sprintf (str, "%d",entier);
  return(str);
}

/*--------------------------------*/
/* start of the description       */
/*--------------------------------*/

main ()
{
  int i;	
  int cur_vect;  /*time*/
  
  DEF_GENPAT("src");
  
  /* interface */
  DECLAR ("Word_in", ":2", "X", IN, "7  downto 0", "");
  DECLAR ("error_out", ":2", "B", OUT, "", "");
  DECLAR ("Address_out", ":2", "X", OUT, "7 downto 0", "");
  DECLAR ("Data_out", ":2", "X", OUT, "7 downto 0", "");
  DECLAR ("reset", ":2", "B", IN, "", "");
  DECLAR ("ck", ":2", "B", IN, "", "");
  DECLAR ("vdd", ":2", "B", IN, "", "");
  DECLAR ("vss", ":2", "B", IN, "", "");

  SETTUNIT("ns"); 
/* patterns @ time = 0ns */
  LABEL ("Simulation of different patterns");

  cur_vect = 0;

  AFFECT (inttostr(cur_vect), "ck"  , "0b0");
  AFFECT (inttostr(cur_vect),  "reset"  , "0b1");
  AFFECT (inttostr(cur_vect),  "Word_in"  , "0x00");
  AFFECT (inttostr(cur_vect), "vdd"  , "0b1");
  AFFECT (inttostr(cur_vect), "vss"  , "0b0");

  int values[]={0x7E, 0x80, 0x74, 0x22, 0xE7, 
		0x7E, 0x81, 0x78, 0x22, 0xAA, 0xE7,
		0x7E, 0x82, 0x74, 0x22, 0xE7, 
		0x7E, 0x80, 0x74, 0x22, 0xE8, 0xE7,
		0x7E, 0x81, 0x78, 0x22, 0xAA, 0xEE, 0xE7};

  cur_vect += 50;
  AFFECT ( inttostr(cur_vect),"ck","0b1" );
  cur_vect += 50;
  AFFECT (inttostr(cur_vect),  "reset"  , "0b0");
  AFFECT ( inttostr(cur_vect),"ck","0b0" );
  cur_vect += 50;

  for (i=0; i<29; i++)		
  {
	AFFECT ( inttostr(cur_vect),"ck","0b1" );
	AFFECT ( inttostr(cur_vect),"Word_in", inttostr(values[i]));
	cur_vect += 50;
	AFFECT ( inttostr(cur_vect),"ck","0b0" );
	cur_vect += 50;
   }

  /* Last pattern */
  AFFECT (inttostr(cur_vect),  "Word_in"  , "0x00");
  AFFECT ( inttostr(cur_vect), "ck", "0b0");
  
  SAV_GENPAT ();
  exit(0);	
}


