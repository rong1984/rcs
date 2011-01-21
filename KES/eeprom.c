#include "htc.h"
#include "eeprom.h"

unsigned char ee_read(unsigned char eeprom_adress)
{
	unsigned char eeprom_data;
	EEADR = eeprom_adress;
	RD	= 1;
	eeprom_data = EEDATA;	
	return eeprom_data;
}

unsigned char ee_write(unsigned char eeprom_adress, unsigned char eeprom_data)
{
	EEDAT = eeprom_data;		// Load Data
	EEADR = eeprom_adress;	// Load Address
	
	GIE	= 0;				// Turn-off Global Interrupts
	WREN = 1;			// Enable writes
	
	EECON2 = 0x55;		// Sequence necessary to unlock EEPROM
	EECON2 = 0xAA;
	WR = 1;				// Start to write

	while(WR)
		;			// Wait for EEPROM write to complete
	
	WREN = 0;
	GIE = 1;
	return 1;
}

/*
void RDword(unsigned int Ind)
{
    Dato = EERead(Ind);
    Dato += (unsigned int) EERead( Ind+1) <<8;
}

//--------------------------------------------------------------------
// RDnext ()
//--------------------------------------------------------------------
void RDnext(void)
{
    // Continue reading
    EEADR++;        // NOTE generate no carry
    Dato = ((RD=1), EEDATA);
    EEADR++;
    Dato += ((RD=1), EEDATA)<<8;
}

//--------------------------------------------------------------------
// WRword ()
//--------------------------------------------------------------------
void WRword(unsigned int Ind)
{
    EEWrite( Ind, Dato); 
	GIE = 1; // write and re-enable interrupt
    EEWrite( Ind+1, Dato>>8); 
	GIE = 1; 
}

//--------------------------------------------------------------------
// Find ()
//--------------------------------------------------------------------
//
// Search through the whole table the given a record whose ID match
//
// INPUT:
//   IDHi, IDMi, IDLo,   serial number to search
//
// OUTPUT:
//   Ind                 address of record (if found)
//   EHop                sync counter value
//   ETemp               second copy of sync counter
// RETURN:               TRUE if matching record  found
//--------------------------------------------------------------------
unsigned char Find(void)
{
    unsigned char Found;
    Found = FALSE;      // init to not found

    for (Ind=0; Ind < (EL_SIZE * MAX_USER); Ind+=EL_SIZE)
    {
        RDword( Ind);       // read first Word
        FCode = (Dato>>8);
        
        if ( (FCode & 0xf0) == 0xf0)		// check if there is a function code
            continue;   // empty  

        if (IDLo != (Dato & 0xff))		// ID match?
            continue;   // fails match
        
        RDnext();       				// Read Next Word
        if ( ( (Dato & 0xff) == IDMi) && ( (Dato>>8) == IDHi))
        {
            Found = TRUE;     // match
            break;
        }
    } // for

    if (Found == TRUE)
    { 
        RDnext();               // read HopHi/Lo
        EHop = Dato;
        RDnext();               // read HopHi2/Lo2
        ETemp= Dato;
     }

     return Found;
}

//--------------------------------------------------------------------
// Insert ()
//--------------------------------------------------------------------
//
// Search through the whole table for an empty space
//
// INPUT:
//   IDHi, IDMi, IDLo,   serial number to insert
//
// OUTPUT:
//   Ind                 address of empty record
//
// RETURN:               FALSE if no empty space found
//
//--------------------------------------------------------------------
unsigned char Insert(void)
{
    for (Ind=0; Ind < (EL_SIZE * MAX_USER); Ind+=EL_SIZE)
    {
        RDword(Ind);        // read first Word
        FCode = (Dato>>8);
        // check if 1111xxxx
        if ( (FCode & 0xf0) == 0xf0)
            return TRUE;    // insert point found
    } // for        

    return  FALSE;          // could not find any empty slot
} // Insert

//--------------------------------------------------------------------
// IDWrite()
//--------------------------------------------------------------------
//
//   store IDHi,Mi,Lo + XF at current address Ind
// INPUT:
//   Ind                 point to record + offset 0 
//   IDHi, IDMi, IDLo    Serial Number
//   XF                  function code
// OUTPUT:
//
//--------------------------------------------------------------------
unsigned char IDWrite(void)
{
    if (!FLearn) 
        return FALSE;           // Guard statement: check if Learn ON

    Dato = Buffer[7];
    Dato = (Dato<<8) + IDLo;
    WRword(Ind);                // write first word

    Dato = IDHi;
    Dato = (Dato<<8) + IDMi;
    WRword(Ind+2);              // write second word
    
    return TRUE;
} // IDWrite
          
//--------------------------------------------------------------------
// HopUpdate()
//--------------------------------------------------------------------
// Upate sync counter of user record at current location
// INPUT:
//   Ind     record + offset 0
//   Hop     current sync counter
// OUTPUT:
//   none
//--------------------------------------------------------------------
unsigned char HopUpdate(void)
{
    if (!FHopOK) 
        return FALSE;           // Guard statement: check if Hop update 

    Hop = ((unsigned int)HopHi<<8) + HopLo;
    Dato = Hop;
    WRword(Ind+4);              // write at offset +4
    Dato = Hop;
    WRword(Ind+6);              // back up copy at offset +6
    FHopOK = FALSE;             // for safety disable updating hopping code
    
    return TRUE;
} // HopUpdate

//--------------------------------------------------------------------
// ClearMem()
//--------------------------------------------------------------------
// Mark all records free
// INPUT:
// OUTPUT:
// USES:
//--------------------------------------------------------------------
unsigned char ClearMem(void)
{
//    char i;
    for (Ind=0; Ind < (EL_SIZE * MAX_USER); Ind+=EL_SIZE)
    {
        Dato = 0xffff;
        WRword( Ind);
    }
  return TRUE;
} // ClearMem
*/

//--------------------------------------------------------------------
// End of File : Table.C
//--------------------------------------------------------------------
        
